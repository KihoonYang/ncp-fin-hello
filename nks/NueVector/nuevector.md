# NUEVECTOR

## Reference
https://github.com/neuvector/neuvector-helm


## Install
```bash
helm repo add neuvector https://neuvector.github.io/neuvector-helm/

helm search repo neuvector/core

kubectl create namespace neuvector

kubectl label  namespace neuvector "pod-security.kubernetes.io/enforce=privileged"

helm install neuvector --namespace neuvector --create-namespace neuvector/core

```

or Install by Rancher

- Cluster Tools
- NeuVector
- **Checked** Customize Helm options before install
- Container Runtime
- **Unchecked** Docker Runtime
- **Checked** Containerd Runtime
- Service Configuration - Manager Service: `LoadBalancer`
- Install
- General Terms - Accept