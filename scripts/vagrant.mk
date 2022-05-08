VAGRANT_BOXES:="generic/ubuntu2004"
VAGRANT_PLUGINS:="vagrant-share vagrant-disksize"

.PHONY: vagrant-local-init:
vagrant-local-init:
	apt-get install libarchive-tools
	${MAKE} vagrant-download-boxes
	${MAKE} vagrant-init-plugins

.PHONY: vagrant-download-boxes
vagrant-download-boxes:
	@for box in ${VAGRANT_BOXES}; do \
		vagrant box add $${box}; \
	done

.PHONY: vagrant-init-plugins
vagrant-init-plugins:
	@for plugin in ${VAGRANT_PLUGINS}; do \
		vagrant plugin install $${plugin}; \
	done

.PHONY: install-kubernetes-local
install-kubernetes-local: vagrant-init-plugins
	@cd vagrant/kubernetes-local
	vagrant up
	vagrant provision

.PHONY: destroy-kubernetes-local
destroy-kubernetes-local:
	@cd vagrant/kubernetes-local
	vagrant destroy --force

.PHONY: machines
machines:
	@vagrant global-status
