OS_ARCH:=amd64
KUBELET_VERSION:=""
KUBECTL_VERSION:=""
KUBEADM_VERSION:=""
RUNC_VERSION:=""
CRICTL_VERSION:=""
SHELL=/bin/bash

include ./scripts/install.mk
include ./scripts/vagrant.mk
include ./scripts/ansible.mk
