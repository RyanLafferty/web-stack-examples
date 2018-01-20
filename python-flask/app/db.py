from init_flask import app
import flask_sqlalchemy, flask_restless

# Configure the database
# ==========================================================================================

app.config['SQLALCHEMY_TRACK_NOTIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:root@db/inventory'
db = flask_sqlalchemy.SQLAlchemy(app)

# ==========================================================================================
