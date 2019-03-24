USER = "$(shell id -u):$(shell id -g)"

app:
	docker-compose up

app-build:
	docker-compose build

app-down:
	docker-compose down

app-bash:
	docker-compose run --user=$(USER) app bash

app-install:
	docker-compose run app make install

app-setup: development-setup-env app-build app-install

development-setup-env:
	docker run -v $(CURDIR):/app -w /app williamyeh/ansible:ubuntu18.04 ansible-playbook ansible/development.yml -i ansible/development -vv

production-setup-env:
	docker run -v $(CURDIR):/app -w /app williamyeh/ansible:ubuntu18.04 ansible-playbook ansible/development.yml -i ansible/production -vv



