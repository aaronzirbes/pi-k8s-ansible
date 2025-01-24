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

## Install Helm and Kubectl

```shell
make install-brew
```

## Run it

```shell
make run
```
## Setup kubectl

```shell
export KUBECONFIG=~/.kube/config.pies
```

Install rook via Helm
```shell
make install-rook
helm repo add rook-release https://charts.rook.io/release
helm install --create-namespace \
  --namespace rook-ceph \
  rook-ceph rook-release/rook-ceph \
  -f values.yaml
```

## Options

* Straight up Bare Metal
  * Microceph?
