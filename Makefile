.PHONY: check spell lint
check: spell lint
	@echo "[OK] local checks passed"

spell:
	@echo ">> codespell (skip if not installed)"; \
	if command -v codespell >/dev/null; then \
	  codespell --ignore-words .codespellignore . || exit 1; \
	else echo "codespell not installed, skipping"; fi

lint:
	@echo ">> markdownlint (skip if not installed)"; \
	if command -v markdownlint >/dev/null; then \
	  markdownlint "**/*.md" -c .markdownlint.json || exit 1; \
	else echo "markdownlint not installed, skipping"; fi
