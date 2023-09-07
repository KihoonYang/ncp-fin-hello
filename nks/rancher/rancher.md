# RANCHER

## Reference
https://ranchermanager.docs.rancher.com/getting-started/quick-start-guides/deploy-rancher-manager/helm-cli

## Install
```bash
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

kubectl create namespace cattle-system

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.crds.yaml

helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.11.0

helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=rancher.hello.io \
  --set replicas=1 \
  --set bootstrapPassword=Devops
```

## After Install
- Set CoreDNS
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: nodelocaldns
  namespace: kube-system
data:
  Corefile: |
    ...
    .:53 {
        errors
        cache 30
        reload
        loop
        bind 169.254.25.10
        forward . /etc/resolv.conf
        prometheus :9253

        hosts {
          103.244.x.y rancher.hello.io

          fallthrough
        }
    }
```
- Add hosts ( /etc/hosts )
```
103.244.x.y rancher.hello.io
```

> [!WARNING]
> Occur **404** Nginx Error @ rancher.hello.io
> check `ingress-nginx-nginx-ingress-controller` pod log
```log
"Ignoring ingress because of error while validating ingress class" ingress="cattle-system/rancher" error="ingress does not contain a valid IngressClass"
```
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: rancher
  namespace: cattle-system
spec:
  ingressClassName: nginx # add ingreeClass
  tls:
    - hosts:
        - rancher.hello.io
      secretName: tls-rancher-ingress
  rules:
    - host: rancher.hello.io
      http:
        paths:
          - path: /
            pathType: ImplementationSpecific
            backend:
              service:
                name: rancher
                port:
                  number: 80
```

