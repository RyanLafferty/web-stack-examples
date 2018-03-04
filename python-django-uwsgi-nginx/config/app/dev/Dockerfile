FROM python:3
LABEL maintainer="RyanLafferty"

# Create app directory
RUN mkdir /app
WORKDIR /app

# Add requirements to app directory
ADD requirements.txt /app/

# Add application to the container
ADD app /app/
ADD app/manage.py /app/

# Install requirements
RUN apt-get update && apt-get install -y uwsgi-plugin-python uwsgi-plugin-python3
RUN pip install -r requirements.txt

# Start application
EXPOSE 8080
ENTRYPOINT ["uwsgi", "--ini", "/app/app/config/uwsgi.ini"]
