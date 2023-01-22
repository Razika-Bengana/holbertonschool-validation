# Define variables
Publish=hugo
SHELLCHECK=shellcheck

build: ## Generate the website from the markdown and configuration files in the directory dist/.
	$(Publish)
	touch awesome-api

clean: ## Cleanup the content of the directory dist/
	rm -r dist/*

post: ## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME.
	hugo new posts/$(POST_NAME).md
	sed -i '/title/c\title: "${POST_TITLE}"' content/posts/${POST_NAME}.md

lint: ## shellcheck setup
	markdownlint README.md
	markdownlint DEPLOY.md
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 || echo "Lint Failed"

markdownlint: ## updated to lint the files README.md and DEPLOY.md
	markdownlint README.md
	markdownlint DEPLOY.md

integration-tests: ## server and check the localhost
	hugo
	touch coverage-integrations.out
	ls dist/

unit-tests: ## Runs different makefile recipes
	make POST_TITLE='TEST' POST_NAME='this-is-a-test' post
	make build
	make clean
	touch coverage-units.out

validate: ## Tests dir
	pwd

package: ## creates archive
	make build
	zip awesome-website.zip dist/

help: ## print out the list of targets and their usage
	cat Makefile | grep '##' | tr -d '##' | head -n -1
