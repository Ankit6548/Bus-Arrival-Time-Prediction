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


Sql_query=("""select * from gps_fetched where status =' 5'  and direction=' 1' and
           trip_id like '%7338656568300882944%' and (
           poll_time like '%2019-03-05 11:1%' or
           poll_time like '%2019-03-05 11:2%' or
           poll_time like '%2019-03-05 11:3%' or
           poll_time like '%2019-03-05 11:4%' or
           poll_time like '%2019-03-05 11:5%' or
           poll_time like '%2019-03-05 12:0%') and 
           (poll_time not like '%2019-03-05 12:05:44%' and
           poll_time not like '%2019-03-05 12:06%' and
           poll_time not like '%2019-03-05 12:07%' and
           poll_time not like '%2019-03-05 12:08%' and
           poll_time not like '%2019-03-05 12:09%')""")
crsr.execute(Sql_query) 
#for result in crsr.execute(Sql_query):
 #   print(result)   
           
       
for latitude in crsr.execute(Sql_query):
    gps_lat.append(latitude[9]) 
for longitude in crsr.execute(Sql_query):   
    gps_long.append(longitude[10])
for time in crsr.execute(Sql_query):
    gps_time.append(time[15])
    """
    cols=["route_id", "direction", "vehicle_id",
                   "last_modified","trip_id","congestion_level","accuracy_level",
                   "status","is_accessible","latitude","longitude","bearing",
                   "pattern_id","has_bike_rack","category","poll_time"] 
    with open("gps_temp_208_direction_1.txt", "w", newline='') as f:
            print(cols,file=f)  
            for row in crsr:
                print(row[0],",",row[1],",",row[2],",",row[3],",",row[4],",",row[5]
                ,",",row[6],",",row[7],",",row[8],",",row[9],",",row[10],",",row[11]
                ,",",row[12],",",row[13],",",row[14],",",row[15],file=f)
       """     

#---------------------------------------------------------------------------------

    
Sql_query=("""select stops.stop_name,stops.stop_lat,stops.stop_lon,a.arrival_time,
               a.departure_time,a.stop_sequence from  stops inner join (SELECT Distinct
              stop_id,stop_sequence,arrival_time,departure_time from Stop_times where 
              Stop_times.trip_id='11496.y1012.10-60-e16-1.8.I') as a on stops.stop_id=a.stop_id
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
gps_lat=[]
gps_long=[]
gps_time=[]

Fixed_208_lat=[]
Fixed_208_long=[]
Fixed_208_timing=[]

print(gps_long)
print(gps_lat)
print(Fixed_208_timing)   
    