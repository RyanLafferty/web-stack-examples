from db import db

class Product(db.Model):
    __tablename__ = 'product'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Unicode(256), default="")
    quantity = db.Column(db.Integer, default=0)
    cost = db.Column(db.Float, default=0)
    price = db.Column(db.Float, default=0)
