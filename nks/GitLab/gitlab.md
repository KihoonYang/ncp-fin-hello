# GitLab

## Reference
https://artifacthub.io/packages/helm/gitlab/gitlab

## Install
```bash
helm repo add gitlab http://charts.gitlab.io/ # https://charts.gitlab.io/ 로 설정하면 repo update 시 EOF 에러가 발생할 수 있다.
helm repo update
helm upgrade --install gitlab gitlab/gitlab \
  --namespace gitlab \
  --create-namespace \
  --version 7.3.2 \
  --timeout 1200s \
  --set global.hosts.domain=hello.io \
  --set certmanager-issuer.email=devops@hello.io \
  --set certmanager.installCRDs=false \
  --set certmanager.install=false \
  --set nginx-ingress.enabled=false \
  --set prometheus.install=false \
  --set global.ingress.provider=nginx \
  --set global.kas.enabled=false \
  --set global.ingress.class=nginx \
  --set global.ingress.enabled=true \
  --set global.edition=ce
```
```
# TO-DO
SMAL Keycloak 연동 설정
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
          103.244.x.y rancher.hello.io gitlab.hello.io

          fallthrough
        }
    }
```
- gitlab-gitlab-initial-root-password

## Install GitLab Runner