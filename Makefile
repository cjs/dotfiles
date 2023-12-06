DOCKER_IMAGE_NAME=dotfiles

#
# Docker
#

.PHONY: docker
docker:
	@if ! docker inspect $(DOCKER_IMAGE_NAME) &>/dev/null; then \
		docker build -t $(DOCKER_IMAGE_NAME) . --build-arg USERNAME="$$(whoami)"; \
	fi
	docker run --rm -it -v "$$(pwd):/home/$$(whoami)/.local/share/chezmoi" dotfiles /bin/bash --login

#
# Chezmoi
#

.PHONY: init
init:
	chezmoi init --apply --verbose

.PHONY: update
update:
	chezmoi apply --verbose

.PHONY: watch
watch:
	DOTFILES_DEBUG=1 watchexec -- chezmoi apply --verbose

.PHONY: reset
reset:
	chezmoi state delete-bucket --bucket=scriptState
	init

.PHONY: reset-config
reset-config:
	chezmoi init --data=false
