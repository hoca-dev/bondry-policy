# Makefile for deploying the Flutter web projects to GitHub

BASE_HREF = /$(OUTPUT)/
GITHUB_USER = hoca-dev
GITHUB_REPO = https://github.com/$(GITHUB_USER)/$(OUTPUT)
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

# Deploy the Flutter web project to GitHub
deploy:
ifndef OUTPUT
	$(error OUTPUT is not set. Usage: make deploy OUTPUT=<output_repo_name>)
endif

	@echo "Deploying to git repository"
	git add . && \
	git commit -m "Auto commit" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u -f origin main

	@echo "✅ Finished deploy: $(GITHUB_REPO)"
	@echo "🚀 Web URL: https://$(GITHUB_USER).github.io/$(OUTPUT)/"

.PHONY: deploy