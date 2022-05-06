OS_ARCH?=amd64
GOLANG_VERSION:="1.17.5"
ANSIBLE_VERSION:=""
VAGRANT_VERSION:="2.2.19"

.PHONY: install
install:
	${MAKE} install-python3
	${MAKE} install-jinja2
	${MAKE} install-vagrant
	${MAKE} install-ansible
	${MAKE} install-go

.PHONY: install-python3
	@echo "Install python3 ..."
ifeq (,$(shell which python3))
	@apt-get update
	@apt-get install python3 python3-pip
endif

.PHONY: install-vagrant
install-vagrant:
	@echo "Install vagrant ..."
ifeq (,$(shell which vagrant))
	@rm -f /tmp/vagrant_${VAGRANT_VERSION}_linux_${OS_ARCH}.zip
	@wget -O /tmp/vagrant_${VAGRANT_VERSION}_linux_${OS_ARCH}.zip https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_linux_${OS_ARCH}.zip
	@unzip /tmp/vagrant_${VAGRANT_VERSION}_linux_${OS_ARCH}.zip -d /usr/local/bin
	@chmod +x /usr/local/bin/vagrant
endif

.PHONY: install-ansible
install-ansible:
	@echo "Install ansible ..."
ifeq (,$(shell which ansible-playbook))
	@pip install ansible
endif

.PHONY: install-go
install-go:
	@echo "Install go with go version manager ..."
ifeq (,$(shell which go))
endif

.PHONY: install-jinja2
install-jinja2:
	@echo "Install jinja2 ..."
ifeq (,$(shell which jinja2))
	@pip install jinja2-cli
endif
