# docker commands
DOCKER_COMMAND := docker
DOCKER_COMPOSE_COMMAND := docker-compose
DOCKER_MACHINE_COMMAND := docker-machine
DOCKER_SWARM_COMMAND := docker swarm

# docker compose files
PYTHON_FLASK_DOCKER_COMPOSE := -f python-flask/docker-compose.yml
PYTHON_DJANGO_DOCKER_COMPOSE := -f python-django/docker-compose.yml
PYTHON_DJANGO_WHISKEY_DOCKER_COMPOSE := -f python-django-uwsgi-nginx/docker-compose.yml
NODE_EXPRESS_DOCKER_COMPOSE := -f node-express/docker-compose.yml

# app containers
PYTHON_FLASK_APP_CONTAINER := flask_app
PYTHON_DJANGO_APP_CONTAINER := django_app
PYTHON_DJANGO_WHISKEY_APP_CONTAINER := django_nginx_app
NODE_EXPRESS_APP_CONTAINER := express_app

# db containers
PYTHON_FLASK_DB_CONTAINER := flask_db
PYTHON_DJANGO_DB_CONTAINER := django_db
PYTHON_DJANGO_WHISKEY_DB_CONTAINER := django_nginx_db
NODE_EXPRESS_DB_CONTAINER := express_db

# nginx containers
PYTHON_DJANGO_WHISKEY_NGINX_CONTAINER := django_nginx

# Environment
.PHONY: hooks clean

hooks:
	cp hooks/* .git/hooks/
clean:
	sh scripts/docker-cleanup.sh

# python flask
.PHONY: flask-up flask-start flask-stop flask-ssh flask-build flask-reup

flask-up:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_FLASK_DOCKER_COMPOSE) up
flask-start:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_FLASK_DOCKER_COMPOSE) start
flask-stop:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_FLASK_DOCKER_COMPOSE) stop
flask-ssh:
	$(DOCKER_COMMAND) exec -it $(PYTHON_FLASK_APP_CONTAINER) /bin/bash
flask-build:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_FLASK_DOCKER_COMPOSE) build
flask-reup: flask-build flask-up

# python django
.PHONY: django-up django-start django-stop django-ssh django-build django-reup

django-up:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_DJANGO_DOCKER_COMPOSE) up
django-start:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_DJANGO_DOCKER_COMPOSE) start
django-stop:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_DJANGO_DOCKER_COMPOSE) stop
django-ssh:
	$(DOCKER_COMMAND) exec -it $(PYTHON_DJANGO_APP_CONTAINER) /bin/bash
django-build:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_DJANGO_DOCKER_COMPOSE) build
django-reup: django-build django-up

# python django whiskey
.PHONY: whiskey-django-up whiskey-django-start whiskey-django-stop whiskey-django-ssh whiskey-django-build whiskey-django-reup

whiskey-django-up:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_DJANGO_WHISKEY_DOCKER_COMPOSE) up
whiskey-django-start:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_DJANGO_WHISKEY_DOCKER_COMPOSE) start
whiskey-django-stop:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_DJANGO_WHISKEY_DOCKER_COMPOSE) stop
whiskey-django-ssh:
	$(DOCKER_COMMAND) exec -it $(PYTHON_DJANGO_WHISKEY_APP_CONTAINER) /bin/bash
whiskey-django-build:
	$(DOCKER_COMPOSE_COMMAND) $(PYTHON_DJANGO_WHISKEY_DOCKER_COMPOSE) build
whiskey-django-reup: whiskey-django-build whiskey-django-up

# python django whiskey
.PHONY: node-express-up node-express-start node-express-stop node-express-ssh node-express-build node-express-reup

node-express-up:
	$(DOCKER_COMPOSE_COMMAND) $(NODE_EXPRESS_DOCKER_COMPOSE) up
node-express-start:
	$(DOCKER_COMPOSE_COMMAND) $(NODE_EXPRESS_DOCKER_COMPOSE) start
node-express-stop:
	$(DOCKER_COMPOSE_COMMAND) $(NODE_EXPRESS_DOCKER_COMPOSE) stop
node-express-ssh:
	$(DOCKER_COMMAND) exec -it $(NODE_EXPRESS_APP_CONTAINER) /bin/bash
node-express-build:
	$(DOCKER_COMPOSE_COMMAND) $(NODE_EXPRESS_DOCKER_COMPOSE) build
node-express-reup: node-express-build node-express-up