# ANSIBLE

## Install
```bash
# ansible install
python3 -m pip install ansible
ansible --version
```

## Run Examples
```bash
ansible-playbook -i ./inventory/dev-web ./playbooks/ping.yaml
```
```bash
ansible-playbook -i ./inventory/dev-web ./playbooks/ping.yaml
[WARNING]: Invalid characters were found in group names but not replaced, use -vvvv to see details

PLAY [servers] ******************************************************************************************

TASK [Gathering Facts] **********************************************************************************
ok: [10.3.20.9]
ok: [10.3.20.10]
ok: [10.3.20.12]

TASK [Example from an Ansible Playbook] *****************************************************************
ok: [10.3.20.10]
ok: [10.3.20.9]
ok: [10.3.20.12]

PLAY RECAP **********************************************************************************************
10.3.20.10                 : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
10.3.20.12                 : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
10.3.20.9                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

> [!NOTE]  
```bash
fatal: [10.3.20.12]: FAILED! => {
    "msg": "Using a SSH password instead of a key is not possible because Host Key checking is enabled and sshpass does not support this.  Please add this host's fingerprint to your known_hosts file to manage this host."
}
```
```bash
export ANSIBLE_HOST_KEY_CHECKING=False
```
