# ELASTIC STACK

## REFERENCE

## Install
```bash
kubectl create ns elastic-system
helm install hello oci://registry-1.docker.io/bitnamicharts/elasticsearch -n elastic-system
```

> [!IMPORTANT] - ILM을 이요한 인텍스 수명주기 관리(rollover)

    1. Index Lifecycle Policy 설정
    2. Index Template 설정
    3. ClusterOutput 설정(Logging Operator)
