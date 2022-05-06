VAGRANT_PLUGINS:="vagrant-share"

.PHONY: vagrant-init-plugins
vagrant-init-plugins:
	@for plugin in ${VAGRANT_PLUGINS}; do \
		vagrant plugin install $${plugin}; \
	done

.PHONY: install-kubernetes-local
install-kubernetes-local: vagrant-init-plugins
	${MAKE} install-k8s-control-plane

.PHONY: install-kubernetes-control-plane
install-kubernetes-control-plane:
	@echo "test"

.PHONY: machines
machines:
	@vagrant global-status
