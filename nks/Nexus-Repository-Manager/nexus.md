# SONATYPE NEXUS REPOSITORY MANAGER

## Reference
https://artifacthub.io/packages/helm/sonatype/nexus-repository-manager/

## Install
```bash
helm repo add sonatype https://sonatype.github.io/helm3-charts/

helm repo update

helm install my-nexus-repository-manager sonatype/nexus-repository-manager \
  --version 59.0.0 \
  --namespace nexus \
  --create-namespace \
  --set ingress.enabled=true
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
          103.244.x.y rancher.hello.io gitlab.hello.io nexus.hello.io

          fallthrough
        }
    }
```

- Add Ingress
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-nexus-repository-manager
  namespace: nexus
spec:
  ingressClassName: nginx
  rules:
    - host: nexus.hello.io
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: my-nexus-repository-manager
                port:
                  number: 8081

```