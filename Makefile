# target: prereqs When you would want to use prerequisites
# We add .PHONY to improve performance and tell Makefile that we are using comands explicitly and not actual files; this also helps escape issues where comands are the same name as files
.PHONY: run-server
run-server:
	poetry run python -m core.manage runserver

.PHONY: install
install:
	poetry install

.PHONY: install-pre-commit
install-pre-commit:
	poetry run pre-commit uninstall ; poetry run pre-commit install

.PHONY: lint
lint:
	poetry run pre-commit run --all-files

.PHONY: migrate
migrate:
	poetry run python -m core.manage migrate

.PHONY: migrations
migrations:
	poetry run python -m core.manage makemigrations

.PHONY: super-user
super-user:
	poetry run python -m core.manage createsuperuser

.PHONY: update
update: install migrate install-pre-commit;
