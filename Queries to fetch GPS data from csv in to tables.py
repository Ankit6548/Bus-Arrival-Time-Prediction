# -*- coding: utf-8 -*-
"""
Created on Fri Jun 28 01:01:10 2019

@author: Ankit Talwar


GPS Data


"""
import sqlite3
import pandas as pd
import csv
from xlsxwriter.workbook import Workbook
# connecting to the database  
connection = sqlite3.connect("Busdata.db") 
# cursor  
crsr = connection.cursor()

#getting the route id by giving any bus number.
route_id_query=("""SELECT id FROM gps_routes WHERE name = "208";""");
for result in crsr.execute(route_id_query):
    print(result)

# using above query to fetch trip id from single route 
trip_id_query=("""SELECT count(distinct trip_id) FROM gps_main_data where route_id in
       (SELECT id FROM gps_routes WHERE name = "208") 
""");
crsr.execute(trip_id_query)  
for result in crsr.execute(trip_id_query):
    print(result) 
#------------------------------not usefull--------------------------------------------------------------------
#using above query, we fetch stop_id from the fetched trip_id.
stop_id_query=("""SELECT id, name from gps_stops where id in 
               (select route_id from gps_main_data where route_id in 
(select id from gps_routes where name ='208')limit 1);  
""");
crsr.execute(stop_id_query)  
for result in crsr.execute(stop_id_query):
    print(result)
#--------------------------------------------------------------------------------------------------------


sql_command = """CREATE TABLE gps_temp (  
route_id blob,	direction,	vehicle_id blob,	last_modified blob, trip_id blob,	congestion_level,
	accuracy_level,	status,	is_accessible,	latitude,	longitude,	bearing,	
	pattern_id blob,	has_bike_rack,	category,	poll_time blob);"""
crsr.execute(sql_command) 
connection.commit()

insert_query=("""insert into gps_temp  (route_id,	direction,	vehicle_id,	last_modified, trip_id,	congestion_level,
	accuracy_level,	status,	is_accessible,	latitude,	longitude,	bearing,	
	pattern_id,	has_bike_rack,	category,	poll_time) select route_id,	direction,	vehicle_id,	last_modified, trip_id,	congestion_level,
	accuracy_level,	status,	is_accessible,	latitude,	longitude,	bearing,	
	pattern_id,	has_bike_rack,	category,	poll_time
 from gps_main_data where route_id=(SELECT id FROM gps_routes WHERE name = "208")
 and vehicle_id is not null and congestion_level is not null and is_accessible is not null
 and pattern_id is not null and has_bike_rack is not null and category is not null order by trip_id, poll_time,last_modified,status""")
crsr.execute(insert_query)  
connection.commit()



    
Sql_query=("""select count(*) from gps_temp""")
crsr.execute(Sql_query)
#connection.commit()  
for result in crsr.execute(Sql_query):
    print(result)

#---------------------------------------------------------------------------------          

with open('gps_temp222.csv','w') as f:
    writer = csv.writer(f)
    for row in crsr.fetchall():
        writer.writerow(row)
        

cols=["route_id", "direction", "vehicle_id",
                   "last_modified","trip_id","congestion_level","accuracy_level",
                   "status","is_accessible","latitude","longitude","bearing",
                   "pattern_id","has_bike_rack","category","poll_time"]        
with open("gps_temp_208.txt", "w", newline='') as f:
        print(cols,file=f)  
        for row in crsr:
            print(row[0],",",row[1],",",row[2],",",row[3],",",row[4],",",row[5]
            ,",",row[6],",",row[7],",",row[8],",",row[9],",",row[10],",",row[11]
            ,",",row[12],",",row[13],",",row[14],",",row[15],file=f)
                  
                  
#------------------------------------------------------------------------------
            
for chunk in pd.read_csv(
        r"C:\Users\Ankit Talwar\my_data.txt", chunksize=10000,):
    chunk.columns=["route_id", "direction", "vehicle_id",
                   "last_modified","trip_id","congestion_level","accuracy_level",
                   "status","is_accessible","latitude","longitude","bearing",
                   "pattern_id","has_bike_rack","category","poll_time"]
    chunk.to_sql(name="gps_fetched", con=connection, if_exists="append", index=False)
connection.commit()
#-------------------------------------------------------------------------------------------         
cols=["route_id", "direction", "vehicle_id",
                   "last_modified","trip_id","congestion_level","accuracy_level",
                   "status","is_accessible","latitude","longitude","bearing",
                   "pattern_id","has_bike_rack","category","poll_time"] 

Sql_query=("""select distinct * from gps_fetched where trip_id='7338656568301053952' and direction=' 1'""")
crsr.execute(Sql_query)

#for result in crsr.execute(Sql_query):
 #   print(result)

with open("gps_fetched_208_7338656568301053952.txt", "w", newline='') as f:
        print(cols,file=f)
        for row in crsr:
            print(row[0],",",row[1],",",row[2],",",row[3],",",row[4],",",row[5]
            ,",",row[6],",",row[7],",",row[8],",",row[9],",",row[10],",",row[11]
            ,",",row[12],",",row[13],",",row[14],",",row[15],file=f)
            

lat=[]
long=[]
arrival_time=[]


#connection.commit()
for latitude in crsr.execute(Sql_query):
    lat.append(latitude[9]) 
for longitude in crsr.execute(Sql_query):   
    long.append(longitude[10])
for time in crsr.execute(Sql_query):
    arrival_time.append(time[15])  
#print(len(lat))
#----------------------------------------------------------------------------
cols=["route_id", "direction", "vehicle_id",
                   "last_modified","trip_id","congestion_level","accuracy_level",
                   "status","is_accessible","latitude","longitude","bearing",
                   "pattern_id","has_bike_rack","category","poll_time"] 

data = zip(distance_btwn_two_stops,total_distance, tot_time_at_each_stop,speed,delay)
col_names=["distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay"]    
with open("dist_time_speed_208_trip65.txt", "w", newline='') as f:
    print(col_names,file=f)
    for row in data:
        print(row[0],",",row[1],",",row[2],",",row[3],",",row[4],file=f)
      

Sql_query=("""drop table gps_fetched""")
crsr.execute(Sql_query)
connection.commit()
for result in crsr.execute(Sql_query):
    print(result)            

connection.close()