.PHONY: all dotfiles

all: link

link:
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".git"); do \
        f=$$(basename $$file); \
        ln -sfn $$file $(HOME)/$$f; \
done; \
