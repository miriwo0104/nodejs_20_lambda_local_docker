.PHONY: init
init: build npm.install

.PHONY: build
build:
	docker compose up --build -d

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: node
node:
	docker compose exec node sh

.PHONY: npm.install
npm.install:
	docker compose exec node npm install

.PHONY: npm.install.package
npm.install.package:
	docker compose exec node npm install $(PACKAGE)

.PHONY: export_zip
export_zip:
	docker compose exec node zip -r function.zip .