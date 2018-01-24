from flask import Flask, request
import flask_sqlalchemy
import flask_restless
import json
import datetime

# Import our database and application object
# ==========================================================================================

from db import db
from init_flask import app

# ==========================================================================================


# Import models
# ==========================================================================================

from product.models import Product

# ==========================================================================================


# Set up corresponding RESTful API
# ==========================================================================================


# Create the database tables.
db.create_all()

# Create the Flask-Restless API manager.
manager = flask_restless.APIManager(app, flask_sqlalchemy_db=db)

# Create API endpoints, which will be available at /api/<tablename> by
# default. Allowed HTTP methods can be specified as well.
manager.create_api(Product, methods=['POST'])


# ==========================================================================================

# Other routes
# ==========================================================================================


@app.route('/')
def hello_world():
    return 'Hello Flask'


@app.route('/api/products', methods=['GET'])
def get_products():
    query_set = Product.query.all()
    return create_json_response(query_set)


# ==========================================================================================


# JSON handlers
# ==========================================================================================


def datetime_handler(x):
    if isinstance(x, datetime):
        return x.isoformat()
    else:
        raise TypeError("Unknown type, given type = " + str(type(x)))


def create_json_response(query_set):
    rows = []
    for item in query_set:
        row = item.__dict__
        row.pop('_sa_instance_state', None)
        rows.append(row)

    response = app.response_class(
        response=str(rows),
        status=200,
        mimetype='application/json')

    return response


# ==========================================================================================


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)
