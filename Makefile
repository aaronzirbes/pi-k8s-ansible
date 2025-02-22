
# Default run task
run: run-local

# Run via Docker compose
run-compose:
	docker-compose up

# Run via docker directly
run-local:
	ansible-playbook -i inventory.ini base.yml

galaxy:
	ansible-galaxy collection install community.general

install-brew:
	brew install helm kubectl

install-rook:
	@echo "ℹ️ This may take a few minutes to download"
	@KUBECONFIG=~/.kube/config.pies helm repo add rook-release https://charts.rook.io/release
	@KUBECONFIG=~/.kube/config.pies helm install \
			   --create-namespace \
			   --namespace rook-ceph \
			   rook-ceph rook-release/rook-ceph \
				-f helm-rook-values.yaml

xinstall-ceph:
	@echo "ℹ️ This may take a few minutes to download"
	@KUBECONFIG=~/.kube/config.pies helm repo add rook-release https://charts.rook.io/release
	@KUBECONFIG=~/.kube/config.pies helm install \
				--create-namespace \
				--namespace rook-ceph \
				rook-ceph-cluster \
				--set operatorNamespace=rook-ceph \
				rook-release/rook-ceph-cluster \
				-f helm-rook-ceph-values.yaml


rook-status:
	kubectl --namespace rook-ceph get pods -l "app=rook-ceph-operator"

xceph-status:
	kubectl --namespace rook-ceph get cephcluster

rook-decribe:
	kubectl --namespace rook-ceph describe pods -l "app=rook-ceph-operator"
