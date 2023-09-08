# ARGO-CD

## Reference
https://argo-cd.readthedocs.io/en/stable/getting_started/#1-install-argo-cd

## Install
kubectl create namespace argocd
kubectl apply -n argocd -f https://github.com/argoproj/argo-cd/blob/master/manifests/ha/install.yaml
                           