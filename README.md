# web-stack-examples

## Installation

1. Docker, docker-compose, docker-machine
2. python3, pip3, node, npm, nodemon

```Bash
make install
```

### Technologies
1. flask, django, express
2. nginx uwsgi
3. mariadb

## Cleaning Up Docker
```Bash
# This will delete any unused docker images and volumes and containers
make clean
```

## Python Flask

### Starting The Server

```Bash
make flask-up
```

### Rebuilding The Docker Container

```Bash
make flask-build && make flask-up

OR

make flask-reup
```

### Python Flask Commands

```Bash
# Builds, (re)creates, starts, and attaches to containers for the Python Flask Stack.
make flask-up

# Starts an already built Python Flask Stack
make flask-start

# Stops the Python Flask stack
make flask-stop

# SSH into the local Python Flask App container
make flask-ssh

# Builds the Python Flask Stack
make flask-build
```

### Accessing The Local Python Flask Server

```Bash
localhost:8080
```


## Python Django

### Starting The Server

```Bash
make django-up
```

### Rebuilding The Docker Container

```Bash
make django-build && make django-up

OR

make django-reup
```

### Python Django Commands

```Bash
# Builds, (re)creates, starts, and attaches to containers for the Python Django Stack.
make django-up

# Starts an already built Python Django Stack
make django-start

# Stops the Python Django Stack
make django-stop

# SSH into the local Python FlaDjangosk App container
make django-ssh

# Builds the Python Django Stack
make django-build
```

### Accessing The Local Python Django Server

```Bash
localhost:8080
```