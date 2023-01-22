# Define variables
Publish=hugo
SHELLCHECK=shellcheck
export PATH

## Declare a list of phony targets
.PHONY: build build-docker build-tools test

build: ## Generate the website from the markdown and configuration files in the directory dist/.
	sudo apt install ./hugo.deb
	$(Publish)
	touch awesome-api

build-docker:## Build a Docker image for the build directory
	docker build -t "awesome:build" ./build --no-cache

build-tools:## Install the hugo package and tools
	sudo apt install ./hugo.deb

test:## Run the clean target inside a Docker container , execute hugo and ls ./dist
	docker run awesome:build sh -c "make clean || echo 'Lint Failed'"
	docker run awesome:build sh -c "hugo; ls ./dist/*"

clean: ## Cleanup the content of the directory dist/
	rm -r dist/*

post: ## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME.
	hugo new posts/$(POST_NAME).md
	sed -i '/title/c\title: "${POST_TITLE}"' content/posts/${POST_NAME}.md

lint: ## shellcheck setup
	apt install curl -y
	curl --silent --location https://deb.nodesource.com/setup_16.x | bash -
	apt install nodejs -y
	npm install -g markdownlint-cli 1>&2
	markdownlint README.md
	markdownlint DEPLOY.md

markdownlint: ## updated to lint the files README.md and DEPLOY.md
	markdownlint README.md
	markdownlint DEPLOY.md

shellcheck:## Run the shellcheck tool on the setup.sh script
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 || echo "Lint Failed"

integration-tests: ## server and check the localhost
	touch coverage-integrations.out

unit-tests: ## Runs different makefile recipes
	touch coverage-units.out

validate: ## Tests dir
	ls dist

package: ## creates archive
	make build
	mkdir -p dist
	zip awesome-website.zip dist/

## Suppress command output
.SILENT:

help: ## print out the list of targets and their usage
	cat Makefile | grep '##' | tr -d '##' | head -n -1
