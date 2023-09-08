# TEKTON PIPELINE

## Reference
https://tekton.dev/docs/operator/
https://operatorhub.io/operator/tektoncd-operator

## Install
```bash
# operator option #1 
curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.25.0/install.sh | bash -s v0.25.0

# operator **option #2** 
kubectl apply -f https://storage.googleapis.com/tekton-releases/operator/latest/release.yaml
# to install pipelines, triggers and dashboard (use profile 'all')
kubectl apply -f https://raw.githubusercontent.com/tektoncd/operator/main/config/crs/kubernetes/config/all/operator_v1alpha1_config_cr.yaml

# or oneline option #3
kubectl apply -f https://storage.googleapis.com/tekton-releases/operator/previous/v0.66.0/release.yaml


# basic (without tetktonconfig) option #4
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
```

> [!IMPORTANT] admission webhook "rancher.cattle.io.namespaces" denied the request: Unauthorized
```bash
# modify culterrole / clusterrolebinding
ref: https://github.com/rancher/rancher/issues/41191

# OR delete CRD
kubectl delete ValidatingWebhookConfiguration rancher.cattle.io
```