from sqlalchemy import create_engine
import pandas as pd
from config import postgresPass as pwd
from sqlalchemy_utils import database_exists, create_database

def get_query(query_file_path):
    with open('Resources/' + query_file_path) as file:
        query = file.read()
    return query

def dump_file(name, csv_file, engine, ):
    df = pd.read_csv('Resources/' + csv_file, index_col=False)
    print('Writing ' + csv_file + ' to database...',  end=' ')
    try:
        output = df.to_sql(con = engine, name = name, if_exists = 'replace', schema='public')
        print('No exceptions occurred!')
        return output
    except Exception as e:
        print('Error! Message: ')
        print(e)
        return 0

usr = 'postgres'
db_name = 'bike_test_db'

engine = create_engine(f'postgresql://{usr}:{pwd}@localhost:5432/{db_name}')
if not database_exists(engine.url):
    print("Creating database...")
    create_database(engine.url)

print("Database exists?", database_exists(engine.url))

create_tables = get_query('create_tables.sql')
engine.execute(create_tables)
# out = dump_file('categories', 'categories.csv', engine )
# out = dump_file('territories', 'territories.csv', engine )
# out = dump_file('calendar', 'calendar.csv', engine )
# out = dump_file('customers', 'customers.csv', engine )
# out = dump_file('products', 'products.csv', engine )
# out = dump_file('combined_sales', 'combined_sales.csv', engine )
# out = dump_file('returns', 'returns.csv', engine )

result = engine.execute("SELECT COUNT(*) FROM calendar;")

for row in result:
    print(row)