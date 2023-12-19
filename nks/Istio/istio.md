# ISTIO

## Reference
https://istio.io/latest/docs/setup/install/helm/

## Install
```bash
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

kubectl create namespace istio-system

helm install istio-base istio/base -n istio-system --set defaultRevision=default
helm install istiod istio/istiod -n istio-system --wait

# Optional
kubectl create namespace istio-ingress
helm install istio-ingress istio/gateway -n istio-ingress --wait

```
# After To-do
- HA Setting
```yaml
spec:
  replicas: 3 # consider node count
  ...

  template:
    spec:
      ...
      affinity:
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
            - weight: 100
              podAffinityTerm:
                labelSelector:
                  matchExpressions:
                    - key: app
                      operator: In
                      values:
                        - istio-ingressgateway
                topologyKey: kubernetes.io/hostname
```

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
  name: app-core-prd
  namespace: istio-system
spec:
  host: '*.ns-app-core-prd.svc.cluster.local'
  trafficPolicy:
    outlierDetection:
      baseEjectionTime: 60s
      consecutiveErrors: 2
      interval: 5s
      maxEjectionPercent: 100
    tls:
      mode: ISTIO_MUTUAL

```

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: hro-apps-gateway-prd
  namespace: istio-system
spec:
  selector:
    istio: ingressgateway
  servers:
    - hosts:
        - k8s.hello.co.kr
      port:
        name: https
        number: 443
        protocol: HTTPS
      tls:
        credentialName: hro-tls-secret
        mode: SIMPLE
    - hosts:
        - biz.hello.co.kr
        - prmadm.hello.co.kr
        - prm.hello.co.kr
        - mob.hello.co.kr
      port:
        name: http
        number: 80
        protocol: HTTP
```

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: hro-virtual-apps-prd
  namespace: istio-system
spec:
  gateways:
    - istio-system/hro-apps-gateway-prd
  hosts:
    - k8s.hello.co.kr
    - biz.hello.co.kr
    - prmadm.hello.co.kr
    - prm.hello.co.kr
    - mob.hello.co.kr
  http:
    - match:
        - uri:
            prefix: /com
      route:
        - destination:
            host: core-com-api-svc-prd.ns-app-core-prd.svc.cluster.local
            port:
              number: 8090
```