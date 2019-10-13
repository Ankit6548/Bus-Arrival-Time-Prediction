# -*- coding: utf-8 -*-
"""
Created on Thu Jun 27 16:56:02 2019

@author: Ankit Talwar
"""
import sqlite3

# connecting to the database  
connection = sqlite3.connect("Busdata.db") 

# cursor  
crsr = connection.cursor()
#create a table that will be converted to dataframe later

Create_df_table=("""Create table Dataframe_table(stop_id,
                                        stop_lat,
                                        stop_long,
                                        stop_sequence,
                                        distance_btwn_stops,
                                        time_taken_btwn_stops,
                                        speed)""");
crsr.execute(Create_df_table)
connection.commit()

Create_temp_table=("""Create table temp2(stop_id,distance_btwn_stops,
                                        time_taken_btwn_stops,
                                        speed)""");
crsr.execute(Create_temp_table)
connection.commit()

data = zip(distance, calc_time_in_hrs,speed)
for d in data:
    sql = ("""insert into temp2(distance_btwn_stops,
                time_taken_btwn_stops,speed) VALUES ('%s', '%s','%s'); """ % d)
    crsr.execute(sql)

connection.commit()

#----------------------------------------------------------


Query=("""drop table Dataframe_table;""")
crsr.execute(Query) 
connection.commit()

Query=("""drop table temp2;""")
crsr.execute(Query) 
connection.commit()
#connection.close()
    
for i in crsr.execute(sql):
    print(i)

#---------------------------

sql_1 = ("""INSERT INTO Dataframe_table (stop_id,
                                        stop_lat,
                                        stop_long,
                                        stop_sequence) SELECT stop_id,
                                        stop_lat,
                                        stop_long,
                                        stop_sequence FROM stop_temp""")
crsr.execute(sql_1)
connection.commit()
for i in range(len(calc_time_in_hrs)):
    sql = ("""update Dataframe_table set distance_btwn_stops=%s,time_taken_btwn_stops=%s,speed=%s""" % (distance[i],
                                                                                                        calc_time_in_hrs[i],
                                                                                                        speed[i]))
    crsr.execute(sql)
    
    
sql = ("""update Dataframe_table set (time_taken_btwn_stops,time_taken_btwn_stops,speed) =(select * from temp2);""")
crsr.execute(sql)
connection.commit()   
sql = ("""select * from Dataframe_table""")
crsr.execute(sql)   
for i in crsr.execute(sql):
    print(i)
