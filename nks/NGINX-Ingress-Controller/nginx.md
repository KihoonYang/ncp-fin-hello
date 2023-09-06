# NGINX Ingress Controller

## reference
https://bitnami.com/stack/nginx-ingress-controller/helm

## Install
```bash
helm install ingress-nginx oci://registry-1.docker.io/bitnamicharts/nginx-ingress-controller  --namespace ingress-nginx --create-namespace --version 9.8.0 --wait
```

> [!NOTE]  
> 기본으로  `replicaset`이 `1`로 설정되있으니, worker node장애를 대시해, `podAntiAffinity`와 `replicaset` 설정을 변경
