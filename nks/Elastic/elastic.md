# ELASTIC STACK

## REFERENCE
- https://www.elastic.co/guide/en/cloud-on-k8s/master/k8s-installing-eck.html
- https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-deploy-elasticsearch.html


## Install
```bash
# Prefer ECK Install
helm repo add elastic https://helm.elastic.co
helm repo update
helm install elastic-operator elastic/eck-operator -n elastic-system --create-namespace

# No Recommand
# kubectl create ns elastic-system
# helm install hello oci://registry-1.docker.io/bitnamicharts/elasticsearch -n elastic-system
```

``` bash
# elasticsearch
cat <<EOF | kubectl apply -f -
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: elasticsearch-dev
  namespace: elastic-system
spec:
  version: 8.11.3
  nodeSets:
  - name: default
    count: 1
    config:
      node.store.allow_mmap: false
EOF
```

``` bash
# kibana
cat <<EOF | kubectl apply -f -
apiVersion: kibana.k8s.elastic.co/v1
kind: Kibana
metadata:
  name: kibana-dev
  namespace: elastic-system
spec:
  version: 8.11.3
  count: 1
  elasticsearchRef:
    name: elasticsearch-dev
EOF
```

``` bash
# apm
cat <<EOF | kubectl apply -f -
apiVersion: apm.k8s.elastic.co/v1
kind: ApmServer
metadata:
  name: apm-server-dev
  namespace: elastic-system
spec:
  version: 8.11.3
  count: 1
  elasticsearchRef:
    name: elasticsearch-dev
EOF
```


> [!IMPORTANT] - ILM을 이요한 인텍스 수명주기 관리(rollover)

    1. Index Lifecycle Policy 설정
    2. Index Template 설정
    3. ClusterOutput 설정(Logging Operator)
    4. DataStream을 이용한 ILM 설정과 Index를 Alieas로 설정

