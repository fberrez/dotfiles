.PHONY: all link claude

all: link claude

link:
	for file in $(shell find $(CURDIR) -maxdepth 1 -name ".*" -not -name ".git" -not -name ".DS_Store" -not -name ".planning" -not -name ".gitignore" -not -name ".claude"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \

claude:
	@mkdir -p $(HOME)/.claude/commands
	@for file in $(shell find $(CURDIR)/.claude/commands -name "*.md" 2>/dev/null); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.claude/commands/$$f; \
		echo "Linked Claude command: $$f"; \
	done
