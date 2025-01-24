# Usage

## Create inventory

update inventory file for your Raspberry Pi IPs/Hosts

## Setup SSH

Add an SSH config section to ~/.ssh/config

```
Host pihost?
  User username
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
```

Add SSH keys to each host

```shell
ssh-copy-id username@pihost1
```

## Install Galaxy Playbooks

```shell
make galaxy
```


## Install Helm

```shell
make install-helm
```

## Run it


```shell
make run
```

