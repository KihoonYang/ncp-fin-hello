# ARGO-ROLLOUT

## Reference
https://argo-rollouts.readthedocs.io/en/stable/installation/

## Install
```bash
kubectl create namespace argo-rollouts

kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

```                           

> [!IMPORTANT] yaml error시(lens termial 환경), 내용을 복사 후, local에서 실행한다.

```ingress
# LB
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```