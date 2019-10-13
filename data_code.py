# -*- coding: utf-8 -*-
"""
Created on Mon Jun 24 16:27:12 2019

@author: Ankit Talwar
"""

# importing module 
import sqlite3
import pandas as pd

# connecting to the database  
connection = sqlite3.connect("Busdata.db") 

# cursor  
crsr = connection.cursor()



#Stop_times_data
for chunk in pd.read_csv(
        r"D:\project\dataset\stop_times.csv", chunksize=1000,):
    chunk.columns=["trip_id", "arrival_time", "departure_time",
                   "stop_id","stop_sequence","stop_headsign","pickup_type",
                  "drop_off_type","shape_dist_traveled"]
    chunk.to_sql(name="Stop_times", con=connection, if_exists="append", index=False)

"""
#Count of rows in a table
Sql_command=("select Count(*) from Stop_times");
crsr.execute(Sql_command) 

for result in crsr.execute(Sql_command):
    print(result)
"""    
    
# SQL command to create a table in the database 
#Trip_data
sql_command = """CREATE TABLE trips (  
route_id BLOB,  
service_id TEXT,  
trip_id BLOB,  
shape_id BLOB,  
trip_headsign TEXT,
direction_id INTEGER);"""
crsr.execute(sql_command) 

Sql_command='PRAGMA TABLE_INFO(trips)'
crsr.execute(Sql_command)
for result in crsr.execute(Sql_command):
    print(result)

#trips_data
for chunk in pd.read_csv(
        r"D:\project\dataset\trips.csv", chunksize=1000,encoding='ISO-8859-1'):
    chunk.columns=["route_id", "service_id", "trip_id",
                   "shape_id","trip_headsign","direction_id"]
    chunk.to_sql(name="trips", con=connection, if_exists="append", index=False)
    
"""
#Count of rows in a table
Sql_command=("select * from trips limit 20");
crsr.execute(Sql_command) 

for result in crsr.execute(Sql_command):
    print(result)
"""


#transfers_data
for chunk in pd.read_csv(
        r"D:\project\dataset\transfers.csv", chunksize=1000,):
    chunk.columns=["from_stop_id", "to_stop_id", "transfer_type",
                   "min_transfer_time"]
    chunk.to_sql(name="transfers", con=connection, if_exists="append", index=False)

"""
#Count of rows in a table
Sql_command=("select count(*) from transfers");
crsr.execute(Sql_command) 

for result in crsr.execute(Sql_command):
    print(result)
"""


									

#calendar_data
for chunk in pd.read_csv(
        r"D:\project\dataset\calendar.csv", chunksize=75,):
    chunk.columns=["service_id", "monday", "tuesday",
                   "wednesday","thursday","friday","saturday","sunday","start_date","end_date"]
    chunk.to_sql(name="calendar", con=connection, if_exists="append", index=False)
"""  
#Count of rows in a table
Sql_command=("select count(*) from calendar");
crsr.execute(Sql_command) 

for result in crsr.execute(Sql_command):
    print(result)
"""

#calendar_dates_data
for chunk in pd.read_csv(
        r"D:\project\dataset\calendar_dates.csv", chunksize=1000,):
    chunk.columns=["service_id", "date", "exception_type"]
    chunk.to_sql(name="calendar_dates", con=connection, if_exists="append", index=False)
"""    
#Count of rows in a table
Sql_command=("select count(*) from calendar_dates");
crsr.execute(Sql_command) 

for result in crsr.execute(Sql_command):
    print(result)
"""
			


#routes_data
for chunk in pd.read_csv(
        r"D:\project\dataset\routes.csv", chunksize=100,):
    chunk.columns=["route_id", "agency_id", "route_short_name","route_long_name","route_type"]
    chunk.to_sql(name="routes", con=connection, if_exists="append", index=False)

#Count of rows in a table
Sql_command=("select count(*) from routes");
crsr.execute(Sql_command) 

for result in crsr.execute(Sql_command):
    print(result)


#shapes_data
for chunk in pd.read_csv(
        r"D:\project\dataset\shapes.csv", chunksize=10000,):
    chunk.columns=["shape_id", "shape_pt_lat", "shape_pt_lon","shape_pt_sequence","shape_dist_traveled"]
    chunk.to_sql(name="shapes", con=connection, if_exists="append", index=False)
				
"""
#Count of rows in a table
Sql_command=("select count(*) from shapes");
crsr.execute(Sql_command) 

for result in crsr.execute(Sql_command):
    print(result)
"""  
sql_command = """CREATE TABLE stops (  
stop_id TEXT,  
stop_name TEXT,  
stop_lat REAL,  
stop_lon REAL);"""
crsr.execute(sql_command) 

Sql_command='PRAGMA TABLE_INFO(stops)'
crsr.execute(Sql_command)
for result in crsr.execute(Sql_command):
    print(result)

#stops_data
for chunk in pd.read_csv(
        r"D:\project\dataset\stops.txt", chunksize=1000,sep=","):
    chunk.columns=["stop_id", "stop_name", "stop_lat","stop_lon"]
    chunk.to_sql(name="stops", con=connection, if_exists="append", index=False)
"""			
#Count of rows in a table
Sql_command=("select * from stops limit 20");
crsr.execute(Sql_command) 

for result in crsr.execute(Sql_command):
    print(result) 
"""

for chunk in pd.read_csv(
        r"D:\project\dataset\GPS Data\busboy-routes.csv", chunksize=100,):
    chunk.columns=["id", "name", "direction",
                   "number","category"]
    chunk.to_sql(name="gps_routes", con=connection, if_exists="append", index=False)
    
"""
#Count of rows in a table
Sql_command=("select * from gps_routes limit 20");
crsr.execute(Sql_command) 

for result in crsr.execute(Sql_command):
    print(result)
"""


for chunk in pd.read_csv(
        r"D:\project\dataset\GPS Data\busboy-stops.csv", chunksize=1000,):
    chunk.columns=["id", "name", "number","latitude","longitude"]
    chunk.to_sql(name="gps_stops", con=connection, if_exists="append", index=False)
"""
Sql_command=("select * from gps_stops limit 20");
crsr.execute(Sql_command) 

for result in crsr.execute(Sql_command):
    print(result)
"""   
sql_command = ("""CREATE TABLE gps_temp (  
route_id blob,	direction,	vehicle_id blob,	last_modified, trip_id blob,	congestion_level,
	accuracy_level,	status,	is_accessible,	latitude,	longitude,	bearing,	
	pattern_id blob,	has_bike_rack,	category,	poll_time)""")
crsr.execute(Sql_command) 

for chunk in pd.read_csv(
        r"D:\project\dataset\GPS Data\busboy-data.csv", chunksize=10000,):
    chunk.columns=["route_id", "direction", "vehicle_id",
                   "last_modified","trip_id","congestion_level","accuracy_level",
                   "status","is_accessible","latitude","longitude","bearing",
                   "pattern_id","has_bike_rack","category","poll_time"]
    chunk.to_sql(name="gps_main_data", con=connection, if_exists="append", index=False)
    

Sql_command=("""select count(*) from gps_main_data""");
crsr.execute(Sql_command)
#connection.commit() 

for result in crsr.execute(Sql_command):
    print(result)
connection.commit()


#-----------------unique buses number running in gps data collection------------

Sql_command=("""select number from gps_routes where id in (select distinct route_id from gps_main_data 
             )""");
crsr.execute(Sql_command)
#connection.commit() 

for result in crsr.execute(Sql_command):
    print(result)


#-----------------unique buses number with routes information running in gps data collection------------

Sql_command=("""select distinct(trip_headsign), a.route_short_name from trips inner join
             (select route_id,route_short_name from routes where route_short_name in 
             (select number from gps_routes where id in 
             (select distinct route_id from gps_main_data 
             )))as a on trips.route_id=a.route_id where direction_id like '%1%'""");
crsr.execute(Sql_command)
for result in crsr.execute(Sql_command):
    print(result)
#-----------------Writing file for extracting details aboutunique buses number
#with routes information running in gps data collection------------
#use above query---
with open("gps_all_unique_buses.txt", "w", newline='') as f:
        for row in crsr:
            print(row[0],",",row[1],file=f)

#-----------------start and end of the gps data collection------------

sql_command = ("""Select poll_time 
               from gps_main_data order by poll_time asc limit 5""")
crsr.execute(sql_command) 
for result in crsr.execute(sql_command):
    print(result)
    
sql_command = ("""Select poll_time 
               from gps_main_data order by poll_time desc limit 5""")
crsr.execute(sql_command) 
for result in crsr.execute(sql_command):
    print(result)


