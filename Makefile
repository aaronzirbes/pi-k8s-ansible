
# Default run task
run: run-local

# Run via Docker compose
run-compose:
	docker-compose up

# Run via docker directly
run-local:
	ansible-playbook -i inventory base.yml

galaxy:
	ansible-galaxy collection install community.general

install-brew:
	brew install helm kubectl

install-rook:
	KUBECONFIG=~/.kube/config.pies helm repo add rook-release https://charts.rook.io/release
	KUBECONFIG=~/.kube/config.pies helm install --create-namespace --namespace rook-ceph rook-ceph rook-release/rook-ceph -f rook-ceph-values.yaml

rook-status:
	kubectl --namespace rook-ceph get pods -l "app=rook-ceph-operator"
	echo "ℹ️ This may take a few minutes to download"
