ANSIBLE_PLUGINS:="molecule molecule-docker yamllint jinja2==3.0.1 ansible<2.10"

.PHONY: ansible-init-plugins
ansible-init-plugins:
	@apt-get install libssl-dev
	@for plugin in ${ANSIBLE_PLUGINS}; do \
		pip install $${plugin} --user; \
	done

.PHONY: ansible-role-test
ansible-role-test: 
	@ansible-galaxy role install -r requirements.yml
	@ansible-galaxy collection install -r requirements.yml
	@molecule create
	@molecule prepare
	@molecule converge
	@molecule verify
	@molecule destroy

