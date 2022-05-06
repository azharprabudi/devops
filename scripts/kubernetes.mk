.PHONY: provision-local-kubernetes
provision-local-kubernetes:
	@kubectl apply -k ../kubernetes/calico
