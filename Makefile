
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

install-helm:
	brew install helm
