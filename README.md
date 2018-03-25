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

# SSH into the local Python Django App container
make django-ssh

# Builds the Python Django Stack
make django-build
```

### Accessing The Local Python Django Server

```Bash
localhost:8080
```


## Python Whiskey Django

### Starting The Server

```Bash
make whiskey-django-up
```

### Rebuilding The Docker Container

```Bash
make whiskey-django-build && make whiskey-django-up

OR

make whiskey-django-reup
```

### Python Whiskey Django Commands

```Bash
# Builds, (re)creates, starts, and attaches to containers for the Python Whiskey Django Stack.
make whiskey-django-up

# Starts an already built Python Whiskey Django Stack
make whiskey-django-start

# Stops the Python Whiskey Django Stack
make whiskey-django-stop

# SSH into the local Python Whiskey Django App container
make whiskey-django-ssh

# Builds the Python Whiskey Django Stack
make whiskey-django-build
```

### Accessing The Local Python Whiskey Django Server

```Bash
localhost:8080
```


## Node Express

### Environment Setup
```Bash
# Installs the required dependencies (must be in the app directory containing the package.json)
# The container uses a volume mount on the app directory so we must install the dependencies prior to creating the container.
npm install
```

### Starting The Server

```Bash
make node-express-up
```

### Rebuilding The Docker Container

```Bash
make node-express-build && make node-express-up

OR

make node-express-reup
```

### Node Express Commands

```Bash
# Builds, (re)creates, starts, and attaches to containers for the Node Express Stack.
make node-express-up

# Starts an already built Node Express Stack
make node-express-start

# Stops the Node Express Stack
make node-express-stop

# SSH into the local Node Express App container
make node-express-ssh

# Builds the Node Express Stack
make node-express-build
```

### Accessing The Local Node Express Server

```Bash
localhost:8080
```