.PHONY: all link claude ghostty

all: link claude ghostty

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
	@for file in settings.json statusline-command.sh; do \
		if [ -f $(CURDIR)/.claude/$$file ]; then \
			ln -sfn $(CURDIR)/.claude/$$file $(HOME)/.claude/$$file; \
			echo "Linked Claude config: $$file"; \
		fi; \
	done

ghostty:
	@mkdir -p "$(HOME)/Library/Application Support/com.mitchellh.ghostty"
	@ln -sfn $(CURDIR)/ghostty/config "$(HOME)/Library/Application Support/com.mitchellh.ghostty/config"
	@echo "Linked Ghostty config"
