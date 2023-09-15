# GITLAB-ALERT


## Description
Prometheus에서 수집된 메트릭 정보와 Alerting 기준으로 Firing된 Alert Message를 Nodejs로 구성된 중계서버에서 가공해 GitLab의 특정 Project의 Issue로 등록한다.

## Architect
Prometheus > Alertmanager > GitLab-Alert(Nodejs) > GitLab

## AlertmanagerConfig
```yaml
apiVersion: monitoring.coreos.com/v1alpha1
kind: AlertmanagerConfig
metadata:
  name: ac-k8s-app
  namespace: cattle-monitoring-system
spec:
  receivers:
    - name: gitlab-alerts
      webhookConfigs:
        - httpConfig:
            tlsConfig: {}
          sendResolved: true
          url: http://gitlab-alert.monitoring-system.svc.cluster.local:80/alerts
  route:
    groupInterval: 5m
    groupWait: 30s
    matchers:
      - name: alertstate
        value: firing
    receiver: gitlab-alerts
    repeatInterval: 1m
```
