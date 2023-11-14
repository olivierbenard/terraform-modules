fmt:
	terraform fmt -recursive

fmt-check:
	@terraform fmt -check -recursive

validate:
	terraform validate
