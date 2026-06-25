.PHONY: help up vagrant-up ansible-provision status down destroy

help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-22s\033[0m %s\n", $$1, $$2}'

up: vagrant-up ansible-provision ## Demarre/provisionne le cluster Kubernetes local

vagrant-up: ## Demarre les VMs du cluster Kubernetes
	cd vagrant && vagrant up

ansible-provision: ## Provisionne Kubernetes, MetalLB, Traefik et la Gateway partagee
	cd ansible && ansible-galaxy collection install -r requirements.yml
	cd ansible && ansible-playbook -i inventory.ini playbook.yml

status: ## Affiche l'etat Vagrant
	cd vagrant && vagrant status

down: ## Eteint les VMs sans les detruire
	cd vagrant && vagrant halt

destroy: ## Detruit les VMs Vagrant
	cd vagrant && vagrant destroy -f
