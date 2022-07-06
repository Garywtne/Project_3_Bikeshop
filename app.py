#!/usr/bin/env python
# coding: utf-8

import datetime as dt
import numpy as np
import pandas as pd

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify

from config import postgresPass as pw
from config import databasename as dbn


#################################################
# Database Setup
#################################################
# create engine to bike_shop.sqlite



protocol = 'postgresql'
username = 'postgres'
password = pw
host = 'localhost'
port = 5432
database_name = dbn
rds_connection_string = f'{protocol}://{username}:{password}@{host}:{port}/{database_name}'
engine = create_engine(rds_connection_string)




# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(engine, reflect=True)
print(Base.classes.keys())




# Save references to each table
customers = Base.classes.customers
sales = Base.classes.combined_sales
calendar = Base.classes.calendar
products = Base.classes.products
categories = Base.classes.categories
returns = Base.classes.returns
territories = Base.classes.territories



# Create our session (link) from Python to the DB
session = Session(engine)

#################################################
# Flask Setup
#################################################
app = Flask(__name__)





#################################################
# Flask Routes
#################################################

@app.route("/")
def welcome():
    return (
        f"Welcome to the Bike Shop Analysis Homepage<br/>"
        f"The avaiable API's are as follows:<br/>"
        f"/api/v1.0/customers<br/>"
        f"/api/v1.0/products<br/>"  
        f"/api/v1.0/categories<br/>"
        f"/api/v1.0/territories<br/>"
        )


# Create the route for Customers.
@app.route("/api/v1.0/customers")
def Customers():
      """Return a list of all customers"""
      session = Session(engine)
            # Query all customers
      results = session.query(customers.firstname, customers.lastname, customers.gender, customers.annualincome, customers.totalchildren).all()
      
      session.close()

        # render_template("customers.html", data=results)
        # inside customer.html use jinja: {{ data }}
        # print(results[:10])
        # return render_template("customer.html", data=results[:10])

      all_customers = []
      for firstname, lastname, gender, annualincome, totalchildren in results:
        customers_dict = {}
        customers_dict["firstname"] = firstname
        customers_dict["lastname"] = lastname
        customers_dict["gender"] = gender
        customers_dict["annualincome"] = annualincome
        customers_dict["totalchildren"] = totalchildren
        all_customers.append(customers_dict)
      return jsonify(all_customers)




@app.route("/api/v1.0/products")
def Products():
      """Return a list of all customers"""
      session = Session(engine)
            # Query all customers
      results = session.query(products.productkey, products.productsku, products.productname).all()
      
      session.close()

        # render_template("customers.html", data=results)
        # inside customer.html use jinja: {{ data }}
        # print(results[:10])
        # return render_template("customer.html", data=results[:10])

      all_products = []
      for productkey, productsku, productname in results:
        products_dict = {}
        products_dict["productkey"] = productkey
        products_dict["productsku"] = productsku
        products_dict["productname"] = productname
        all_products.append(products_dict)
      return jsonify(all_products)

@app.route("/api/v1.0/categories")
def Categories():
      """Return a list of all categories"""
      session = Session(engine)
            # Query all customers
      results = session.query(categories.subcategoryname, categories.productsubcategorykey,categories.categoryname, categories.productcategorykey ).all()
      
      session.close()

        # render_template("customers.html", data=results)
        # inside customer.html use jinja: {{ data }}
        # print(results[:10])
        # return render_template("customer.html", data=results[:10])

      all_categories = []
      for subcategoryname, productsubcategorykey, categoryname,productcategorykey in results:
        category_dict = {}
        category_dict["subcategoryname"] = subcategoryname
        category_dict["productsubcategorykey"] = productsubcategorykey
        category_dict["categoryname"] = categoryname
        category_dict["productcategorykey"] = productcategorykey
        all_categories.append(category_dict)
      return jsonify(all_categories)

@app.route("/api/v1.0/territories")
def Territories():
      """Return a list of all categories"""
      session = Session(engine)
            # Query all customers
      results = session.query(territories.salesterritorykey, territories.continent,territories.country, territories.region ).all()
      
      session.close()

        # render_template("customers.html", data=results)
        # inside customer.html use jinja: {{ data }}
        # print(results[:10])
        # return render_template("customer.html", data=results[:10])

      all_territories = []
      for salesterritorykey, continent, country,region in results:
        territory_dict = {}
        territory_dict["salesterritorykey"] = salesterritorykey
        territory_dict["continent"] = continent
        territory_dict["country"] = country
        territory_dict["region"] = region
        all_territories.append(territory_dict)
      return jsonify(all_territories)

if __name__ == "__main__":
    app.run(debug=True)






