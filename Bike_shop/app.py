#!/usr/bin/env python
# coding: utf-8

# In[1]:


import datetime as dt
import numpy as np
import pandas as pd

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify


# In[ ]:


#################################################
# Database Setup
#################################################
# create engine to bike_shop.sqlite


# In[2]:


engine = create_engine("sqlite:///../Resources/bike_shop.sqlite")


# In[3]:


# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(engine, reflect=True)
print(Base.classes.keys())


# In[4]:


# Save references to each table
Customers = Base.classes.customer
Products = Base.classes.products
Territories = Base.classes.territories
Categories = Base.classes.categories
Calendar = Base.classes.calendar


# In[5]:


# Create our session (link) from Python to the DB
session = Session(engine)

#################################################
# Flask Setup
#################################################
app = Flask(__name__)


# In[6]:


#################################################
# Flask Routes
#################################################

@app.route("/")
def welcome():
    return (
        f"Welcome to the Bike Shop Analysis Homepage<br/>"
        f"The avaiable API's are as follows:<br/>"
        f"/api/v1.0/Customers<br/>"
        f"/api/v1.0/Products<br/>"
        f"/api/v1.0/Territories<br/>"
        f"/api/v1.0/Categories<br/>"
        )


# In[ ]:


# Create the route for Customers.

# @app.route("/api/v1.0/Customers")


# In[7]:


if __name__ == "__main__":
    app.run(debug=True)


# In[ ]:




