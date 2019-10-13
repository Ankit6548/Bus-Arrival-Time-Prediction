# -*- coding: utf-8 -*-
"""
Created on Tue Jun 25 00:27:41 2019

@author: Ankit Talwar
"""
# importing module 
import sqlite3

# connecting to the database  
connection = sqlite3.connect("Busdata.db") 

# cursor  
crsr = connection.cursor()

#getting the route id by giving any bus number.
route_id_query=("""SELECT route_id FROM routes WHERE route_short_name = "208";""");
for result in crsr.execute(route_id_query):
    print(result)

# using above query to fetch trip id from single route 
trip_id_query=("""SELECT DISTINCT trips.trip_id FROM trips join routes on trips.route_id in
       (SELECT route_id FROM routes WHERE route_short_name = "208") limit 1;  
""");
crsr.execute(trip_id_query)  
for result in crsr.execute(trip_id_query):
    print(result) 
    
#using above query, we fetch stop_id from the fetched trip_id.
stop_id_query=("""SELECT Distinct stop_id,stop_sequence from Stop_times where 
               Stop_times.trip_id = (SELECT trips.trip_id FROM 
               trips where trips.route_id = (SELECT route_id FROM 
               routes WHERE route_short_name = "208") limit 1);  
""");
crsr.execute(stop_id_query)  
for result in crsr.execute(stop_id_query):
    print(result)
 
#below query fetches the stops details after giving the stop_id. We need this 
#data in a temp table to create a list
            
bus='208'            
stops_query=  ("""
select stops.stop_id,stops.stop_lat,stops.stop_lon,a.arrival_time,
a.departure_time,a.stop_sequence from  stops inner join (SELECT Distinct
   stop_id,stop_sequence,arrival_time,departure_time from Stop_times where 
   Stop_times.trip_id in (SELECT   DISTINCT trips.trip_id FROM trips where 
   trips.route_id in (SELECT route_id FROM routes WHERE route_short_name = %s)
        limit 1)) as a on stops.stop_id=a.stop_id
 order by a.stop_sequence asc 
    
   """%(bus))     
             
crsr.execute(stops_query)  
for result in crsr.execute(stops_query):
    print(result)


#creating a new temp table for storing above stops details.
Create_table=("""Create table stop_temp(stop_id,
                                        stop_lat,
                                        stop_long,
                                        arrival_time,
                                        departure_time,
                                        stop_sequence) """);
crsr.execute(Create_table)
connection.commit()
 
insert_stops_details=("""insert into stop_temp select stops.stop_id,stops.stop_lat,stops.stop_lon,a.arrival_time,
a.departure_time,a.stop_sequence from  stops inner join (SELECT Distinct
   stop_id,stop_sequence,arrival_time,departure_time from Stop_times where 
   Stop_times.trip_id in (SELECT   DISTINCT trips.trip_id FROM trips where 
   trips.route_id in (SELECT route_id FROM routes WHERE route_short_name = %s)
        limit 1)) as a on stops.stop_id=a.stop_id
 order by a.stop_sequence asc 
    
   """%(bus))    
crsr.execute(insert_stops_details)  

#for result in crsr.execute(insert_stops_details):
 #   print(result)

#-------------------------------------------------------------------------------


Query=("""select * from stop_temp;""")
crsr.execute(Query)
for result in crsr.execute(Query):
    print(result)


lat=[]
long=[]
arrival_time=[]
departure_time=[]
#connection.commit()  
for latitude in crsr.execute(Query):
    lat.append(latitude[1]) 
for longitude in crsr.execute(Query):   
    long.append(longitude[2])
for time in crsr.execute(Query):
    arrival_time.append(time[3]) 
for time in crsr.execute(Query):   
    departure_time.append(time[4])
    

print(lat)
print(long)
print(arrival_time)
print(departure_time)

#--------------drop temp table--------------------------------------------------------------
Query=("""drop table stop_temp;""")
crsr.execute(Query) 
connection.commit()
connection.close()
    