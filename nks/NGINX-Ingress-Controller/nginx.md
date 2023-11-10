# NGINX Ingress Controller

## Reference
https://bitnami.com/stack/nginx-ingress-controller/helm

## Install
```bash
helm install ingress-nginx oci://registry-1.docker.io/bitnamicharts/nginx-ingress-controller  \
    --namespace ingress-nginx \
    --create-namespace \
    --version 9.8.0 \
    --wait
```

> [!NOTE]  
> 기본으로  `replicaset`이 `1`로 설정되있으니, worker node장애를 대시해, `podAntiAffinity`와 `replicaset` 설정을 변경

## Attachment File Size Issue
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: mattermost-mattermost-team-edition
  namespace: mattermost
  labels:
    app.kubernetes.io/instance: mattermost
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: mattermost-team-edition
    helm.sh/chart: mattermost-team-edition-6.6.22
    k8slens-edit-resource-version: v1
    velero.io/backup-name: mattermost-230715
    velero.io/restore-name: mattermost-230715-20230715100149
  annotations:
    kubernetes.io/ingress.class: nginx
    kubernetes.io/tls-acme: 'true'
    meta.helm.sh/release-name: mattermost
    meta.helm.sh/release-namespace: mattermost
    nginx.ingress.kubernetes.io/proxy-body-size: 150M # Body Size
    nginx.ingress.kubernetes.io/ssl-redirect: 'true'
spec:
  tls:
    - hosts:
        - mattermost.herosonsa.co.kr
      secretName: hro-tls-secret
  rules:
    - host: mattermost.hello.co.kr
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: mattermost-team-edition
                port:
                  number: 8065
```