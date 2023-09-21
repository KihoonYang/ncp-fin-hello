# GitLab

## Reference
https://artifacthub.io/packages/helm/gitlab/gitlab
https://docs.gitlab.com/charts/installation/deployment.html

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






## Upgrade
```bash
helm get values gitlab > gitlab.yaml

helm upgrade gitlab gitlab/gitlab \
  --version <new version> \
  -f gitlab.yaml \
  --set gitlab.migrations.enabled=true \
  --set ...
```
> [!IMPORTANT] 
> install, upgrade 후, HPA 내용을 확인하고 적정한 수준으로 조정이 필요하다.

> [!NOTE]
> GitLab의 해당 repository에서 commit/push event가 발생하면 원격지 백업 Repository에 동일한 Branch로 소스가 반영된다.
> Repository > Settings > Repository > Mirroing repositories > Add new
> ex) https://{userid}@mirrorsite-url/repo

