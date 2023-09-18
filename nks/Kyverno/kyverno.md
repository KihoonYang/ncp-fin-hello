# KYVERNO

## Reference
https://kyverno.io/docs/introduction/#quick-start
https://piotrminkowski.com/2023/08/22/resize-cpu-limit-to-speed-up-java-startup-on-kubernetes/

## Install
```bash
helm repo add kyverno https://kyverno.github.io/kyverno/

helm repo update

helm install kyverno kyverno/kyverno -n kyverno --create-namespace \
--set admissionController.replicas=3 \
--set backgroundController.replicas=2 \
--set cleanupController.replicas=2 \
--set reportsController.replicas=2

```

## TO-DP
> [!NOTE]  
> FEATURE STATE: Kubernetes v1.27 [alpha]