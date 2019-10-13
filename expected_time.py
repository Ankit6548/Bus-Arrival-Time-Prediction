# -*- coding: utf-8 -*-
"""
Created on Wed Jul  3 11:36:25 2019

@author: Ankit Talwar
"""

import sqlite3
import pandas as pd
import csv
from xlsxwriter.workbook import Workbook
import re
# connecting to the database  
connection = sqlite3.connect("Busdata.db") 
# cursor  
crsr = connection.cursor()
#------------------------------------------------


gps_lat=[]
gps_long=[]
gps_time=[]
Fixed_208_lat=[]
Fixed_208_long=[]
Fixed_208_timing=[]

Sql_query=("""drop table gps_trip_data_temp""")
crsr.execute(Sql_query)
connection.commit()


for chunk in pd.read_csv(
        r"C:\Users\Ankit Talwar\my_trip_data_trip65.txt", chunksize=10000,):
    chunk.columns=["route_id", "direction", "vehicle_id",
                   "last_modified","trip_id","congestion_level","accuracy_level",
                   "status","is_accessible","latitude","longitude","bearing",
                   "pattern_id","has_bike_rack","category","poll_time"]
    chunk.to_sql(name="gps_trip_data_temp", con=connection, if_exists="append", index=False)
connection.commit()



Sql_query=("""select * from gps_trip_data_temp""")
crsr.execute(Sql_query)
#for result in crsr.execute(Sql_query):
    #print(result)   
           
       
for latitude in crsr.execute(Sql_query):
    gps_lat.append(latitude[9]) 
for longitude in crsr.execute(Sql_query):   
    gps_long.append(longitude[10])
for time in crsr.execute(Sql_query):
    gps_time.append(time[15])
    

#---------------------------------------------------------------------------------

    
Sql_query=("""select stops.stop_name,stops.stop_lat,stops.stop_lon,a.arrival_time,
               a.departure_time,a.stop_sequence from  stops inner join (SELECT Distinct
              stop_id,stop_sequence,arrival_time,departure_time from Stop_times where 
              Stop_times.trip_id='11558.y100m.10-60-e16-1.8.I') as a on stops.stop_id=a.stop_id
            order by a.stop_sequence asc """)
crsr.execute(Sql_query)
#for result in crsr.execute(Sql_query):
 #   print(result)
for latitude in crsr.execute(Sql_query):
    Fixed_208_lat.append(latitude[1]) 
for longitude in crsr.execute(Sql_query):   
    Fixed_208_long.append(longitude[2])
for time in crsr.execute(Sql_query):
    Fixed_208_timing.append(time[3])

 #-----------------------------------------------------------------------------------    


print(gps_lat)
print(gps_long)
print(gps_time)
print(Fixed_208_timing)   
    
 #-----------------------------------------------------------------------------------   

Sql_query=("""select a.trip_id,a.arrival_time,b.trip_headsign from Stop_times
           as a inner join( select trip_id,trip_headsign from trips where 
           route_id= '10-60-e16-1')as b on a.trip_id=b.trip_id and
           stop_sequence='1' and b.trip_headsign='Curraheen Village - Cork City Hall' 
           and arrival_time='13:40:00'""")
crsr.execute(Sql_query)
for result in crsr.execute(Sql_query):
    print(result)
    
    
Sql_query=("""select a.trip_id,a.arrival_time,b.trip_headsign from Stop_times
           as a inner join( select trip_id,trip_headsign from trips where 
           route_id= '10-60-e16-1')as b on a.trip_id=b.trip_id and
           stop_sequence='1' and b.trip_headsign='Curraheen Village - Cork City Hall' 
           order by arrival_time""")
crsr.execute(Sql_query)
for result in crsr.execute(Sql_query):
    print(result)
    
Sql_query=("""select stops.stop_name,stops.stop_lat,stops.stop_lon,a.arrival_time,
               a.departure_time,a.stop_sequence from  stops inner join (SELECT Distinct
              stop_id,stop_sequence,arrival_time,departure_time from Stop_times where 
              Stop_times.trip_id='11561.y100m.10-60-e16-1.8.I') as a on stops.stop_id=a.stop_id
            order by a.stop_sequence asc """)
crsr.execute(Sql_query)
for result in crsr.execute(Sql_query):
    print(result)