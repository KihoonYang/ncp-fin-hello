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