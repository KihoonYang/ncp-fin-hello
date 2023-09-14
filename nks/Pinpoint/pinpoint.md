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


> [!IMPORTANT]
> In server(pinpoint-collector), `Header size exceeded max allowed size` error occurs.
> collector의 이미지를 변경해야한다.(2.5.2 -> 2.5.2.1)

**reference**
- https://github.com/pinpoint-apm/pinpoint/issues/10016
- https://github.com/pinpoint-apm/pinpoint-docker/tree/master/pinpoint-collector


