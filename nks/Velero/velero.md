# VELERO

# Reference
https://guide-fin.ncloud-docs.com/docs/k8s-k8suse-velero

# Install
```bash
# Velero Client
cd /tmp
wget https://github.com/vmware-tanzu/velero/releases/download/v1.11.1/velero-v1.11.1-linux-arm64.tar.gz
tar -xvzf velero-v1.11.1-linux-arm64.tar.gz
sudo mv velero-v1.11.1-linux-arm64/velero /usr/local/bin/velero


# Secret
vi cloud-credential

[default]
aws_access_key_id=B8706A69B7**********
aws_secret_access_key=7C48BD41C67993AD8B693A6B335EFB**********
region=FKR
server_api_uri=https://fin-ncloud.apigw.fin-ntruss.com/vserver/v2


# Velero Server
  velero install \
  --provider velero.io/aws \
  --bucket hro-d-nks-backup \
  --plugins velero/velero-plugin-for-aws:v1.6.2,nks.private-ncr.fin-ntruss.com/velero-plugin-for-ncloud:v0.0.7 \
  --backup-location-config region=kr-standard,s3ForcePathStyle="true",s3Url=https://kr.object.private.fin-ncloudstorage.com \
  --use-volume-snapshots=false \
  --secret-file=./cloud-credential
```