# ARGO-CD

## Reference
https://argo-cd.readthedocs.io/en/stable/getting_started/#1-install-argo-cd

## Install
```bash
kubectl create namespace argocd

kubectl apply -n argocd -f https://github.com/argoproj/argo-cd/blob/master/manifests/ha/install.yaml
```                           

> [!IMPORTANT] yaml error시(lens termial 환경), 내용을 복사 후, local에서 실행한다.

```ingress
# LB
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```