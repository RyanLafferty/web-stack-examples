# docker commands
DOCKER_COMMAND := docker
DOCKER_COMPOSE_COMMAND := docker-compose
DOCKER_MACHINE_COMMAND := docker-machine
DOCKER_SWARM_COMMAND := docker swarm

# docker compose files
PYTHON_FLASK_DOCKER_COMPOSE := -f python-flask/docker-compose.yml
PYTHON_DJANGO_DOCKER_COMPOSE := -f python-django/docker-compose.yml
PYTHON_DJANGO_WHISKEY_DOCKER_COMPOSE := -f python-django-uwsgi-nginx/docker-compose.yml

# app containers
PYTHON_FLASK_APP_CONTAINER := flask_app
PYTHON_DJANGO_APP_CONTAINER := django_app
PYTHON_DJANGO_WHISKEY_APP_CONTAINER := django_nginx_app
NODE_EXPRESS_APP_CONTAINER := node_app

# db containers
PYTHON_FLASK_DB_CONTAINER := flask_db
PYTHON_DJANGO_DB_CONTAINER := django_db
PYTHON_DJANGO_WHISKEY_DB_CONTAINER := django_nginx_db
NODE_EXPRESS_DB_CONTAINER := node_db

# nginx containers
PYTHON_DJANGO_WHISKEY_NGINX_CONTAINER := django_nginx

# Environment
.PHONY: hooks

hooks:
	cp hooks/* .git/hooks/

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
