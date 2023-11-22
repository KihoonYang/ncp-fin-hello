# RABBITMQ

# Reference
https://www.rabbitmq.com/definitions.html

## Install
```bash
kubectl creaate ns ns-rabbitmq-dev
helm install hello oci://registry-1.docker.io/bitnamicharts/rabbitmq -n ns-rabbitmq-dev
--set replicaCount=3 \
# options
--set loadDefinition.enabled=tue \
--set loadDefinition.file=/app/load_definition.json \
--set loadDefinition.existingSecret=""
```


## Export and Import
```bash
# Export
rabbitmqctl export_definitions /path/to/definitions.file.json

# Import
rabbitmqctl import_definitions /path/to/definitions.file.json
```
