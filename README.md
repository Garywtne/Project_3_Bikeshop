# Project 3

## BIKE SHOP

## Team: 

Gary  |  Sofia  |  Noshaad  |  Emmanuela

In this project. We have taken the financial root to help the owner of AdventureWorks make better business decisions. 
The results will give them an idea of which products are the best sellers and to invest in, which are being returned the most and collate general 
information about the customers that may be of help to the company such as which salary range of customers do we need to focus our marketing on?

Our aim is to make our dashboard as user friendly as possible. Allowing the end user to be 
able to explore the Adventureworks sales data themselves. Creating Graphs and maps to 
compare our findings.

---


### The 10 tables from which we Loaded 8 are:

* AdventureWorks_Calendar
* AdventureWorks_Customers
* AdventureWorks_Product_Categories
* AdventureWorks_Product_Subcategories
* AdventureWorks_Products
* AdventureWorks_Returns
* AdventureWorks_Sales_2015
* AdventureWorks_Sales_2016
* AdventureWorks_Sales_2017
* AdventureWorks_Territories

This data was taken from: https://www.kaggle.com/datasets/ukveteran/adventure-works?select=AdventureWorks_Sales_2015.csv


## Extract Transform Load Process

We Extracted the data as a CSV from the above website and converted it into our Pandas Dataframe. 

We Transform our data, cleaning in Jupyter notebooks.

Finally we loaded the data into Postgress, created joins of the multiple tables and ran queries to retrieve resulst to which
we then transformed into plots using the new JavaScritp Library plotly.
This was used to make a interactive Website for the owner of AdventureWorks and other to look through for sale related investigations


### Challenges faced (Ref : 01_Adventure_works_data_ETL)

To begin with creating a Kaggle data folder, we put the Kaggle CSV's into this folder (10 tables originally) 
then used Jupyter notebook and pandas to read the CSV's :

First challenge we had with 'AdventureWorks_Customers CSV', would not read due to encoding, secondly the date was in the wrong format (.dt.strftime('%Y-%m-%d') for SQL we had to change date format for use. 

other formatting issues we had were :

* .str.replace('$' ,'')
* .str.replace(',' ,'')
* pd.to_numeric(Customers_df['AnnualIncome'])
* categories.rename(columns = {'ProductSubcategoryKey':'productsubcategorykey','SubcategoryName':'subcategoryname', 'ProductCategoryKey':'productcategorykey',
* 'CategoryName':'categoryname'}, inplace = True)

Once this data formating/cleaning had been done for the 'AdventureWorks_Customers CSV' we faced similar challenges in some of the other CSV's

The next obstacle that we came across were 'Capital letters' which was preventing us from creating the joins properly. This took us a while to figure out and resolve as we had to recreate all the table and redo all the ork we had already done.

Saved all of the original CSV's into the Resources folder to access them from the website and visitors to the website could also have access to them.

## Next

We investigated the data created database using PgAdmin called Adventure_works and populated the tables 

Used a text file (bike_shop_CREATE_TABLES_LC.txt) we created the table structure for data to be added.

Below is a copy of the ERD plan showing our use of Primary and Foriegn Keys. 

![ERD](https://user-images.githubusercontent.com/85430216/177748468-7098531c-2ab3-462e-8550-45a653dc7090.png)

Created a config.py file and gitignore to protect the security of passwords and the database name

![Config](https://user-images.githubusercontent.com/85430216/177750268-de507efa-8b1b-4f65-9b1a-ddbcb6aa84b9.PNG)

And established a connection to the database

![Connection](https://user-images.githubusercontent.com/85430216/177749939-1d968aad-2295-48f3-bca6-a310d35eb85a.PNG)

We then populated the database by running the 01_Adventure_works_data_ETL notebook

![image](https://user-images.githubusercontent.com/100169801/177624270-b4c74be0-0295-4dcd-82cc-92483f9ad95b.png)

Our queries and visualizations were created using seperate notebooks, again a connection was established using the config file.

We were able to create complex joins to retrieve that data required to create our queries and visualizations

![image](https://user-images.githubusercontent.com/100169801/177627722-d5838e48-e383-4a9f-beef-5101e032b633.png)


##### This is an image of the file structre we were using 

![FileStructure](https://user-images.githubusercontent.com/85430216/177750419-13c58010-1513-46f7-8d92-bbc3f7c9484c.PNG)

The notebooks are prefixed with a number to guide thier operation and the  files and visualizations created are directed to the correct folders for thier use on the website.

## Finally 
---

Now the files and visualizations have been created and placed into the correct folders so that the website can be populated

---
image of coding in the index file which was to be the homepage of our webpage.

![Index](https://user-images.githubusercontent.com/85430216/177752613-13eaa5ec-1002-4fe0-9cc0-2b16e043f2b0.PNG)

---

The styling and adding interactive links to this webpage was a major challenge, this took a lot of time and effort. There were numerous challenge within the design and function of the webpage

   * data not displaying correctly
   * dropdown installing and correct positioning
   * background not completely one colour
   * pages taking too long to load
   * plots not appearing as expected on homepage
   * and many many more!
    

## Examples of the plots created 
---

### Plot showing Bike Sales by Colour:
![image](https://user-images.githubusercontent.com/100169801/177628252-d457d506-76c6-447e-b921-0e7e57da0a78.png)

---

### Plot showing Bike Sales by Size: 
![image](https://user-images.githubusercontent.com/100169801/177628408-1062e037-1aa6-42f2-b7fc-a14a8abee3e5.png)

---

### Plot showing Bike Sales by Model:
![image](https://user-images.githubusercontent.com/100169801/177628651-622ff9a2-c53b-464d-bfa3-5b2aa34b2a08.png)

---

### Plot showing Bike Sales by Country:
![image](https://user-images.githubusercontent.com/100169801/177628734-82c24546-2cae-4aa4-8b96-da6f68256d4e.png)



## Other Avenues we explored but were unable to use in the final project


We also worked on a Flask application we unfortunately did not manifest in the end.

---
images of app.py file :

![image](https://user-images.githubusercontent.com/100169801/177630956-941cf1f4-30a5-4ed2-9c72-2fa6398b3b45.png)

![image](https://user-images.githubusercontent.com/100169801/177631694-ec900fdd-bec7-41b4-9aa0-b1987d38fbde.png)
---

We used MatPlotLib to visualise the data set to begin with. After the data was sorted and cleaned we used MatPlotLib to
create visuals that we could later make using a libary.

---
image:
--
![image](https://user-images.githubusercontent.com/100169801/177632463-d0c65872-37f3-4874-b3bc-c4b90180e698.png)

---

Also made visuals on another program outside of the courses remits and created these visuals 

--
![image](https://user-images.githubusercontent.com/100169801/177632162-42466ce5-6c07-499a-b214-a0c863265085.png)

---

we also looked at another JavaScript Library:

![image](https://user-images.githubusercontent.com/100169801/177633362-9daa9210-e75a-42a2-b4d8-4122bc988727.png)
![image (1)](https://user-images.githubusercontent.com/100169801/177637644-e4974ddc-46c0-4a0d-bdec-f02df7a547e4.png)


----  END  -----







































































