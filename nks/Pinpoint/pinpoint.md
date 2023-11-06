# PINPOINT

# Reference
https://github.com/pinpoint-apm/pinpoint
> [!NOTE]  
> no more support helmchat install so, it's a customized.

## Install
```bash
kubectl create ns monitoring-system

helm install pinpoint . -n monitoring-system
```

## Change hbase TTL 
```bash
## hbase의  TTL 설정을 변경하기 위해 이미지의 변경 필요함
root@pinpoint-pinpoint-hbase-0:/opt/hbase# sed 's/31536000/604800/' hbase-update-ttl.hbase > hbase-update-hro.hbase
root@pinpoint-pinpoint-hbase-0:/opt/hbase# sed -i 's/5184000/604800/' hbase-update-hro.hbase

root@pinpoint-pinpoint-hbase-0:/opt/hbase/hbase-1.2.6/bin# ./hbase shell /opt/hbase/hbase-update-hro.hbase 
```


> [!IMPORTANT]
> **istio** In server(pinpoint-collector), `Header size exceeded max allowed size` error occurs.
> collector의 이미지를 변경해야한다.(2.5.2 -> 2.5.2.1)

**reference**
- https://github.com/pinpoint-apm/pinpoint/issues/10016
- https://github.com/pinpoint-apm/pinpoint-docker/tree/master/pinpoint-collector
- https://ddasi-live.tistory.com/66



/opt/hbase# sed 's/31536000/604800/' hbase-update-ttl.hbase > hbase-update-hro.hbase
root@pinpoint-pinpoint-hbase-0:/opt/hbase# sed -i 's/5184000/604800/' hbase-update-hro.hbase

root@pinpoint-pinpoint-hbase-0:/opt/hbase/hbase-1.2.6/bin# ./hbase shell /opt/hbase/hbase-update-hro.hbase 