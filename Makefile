.PHONY: push
push:
	okteto build -t okteto/hello-world:ruby-dev --target dev .
	okteto build -t okteto/hello-world:ruby .
