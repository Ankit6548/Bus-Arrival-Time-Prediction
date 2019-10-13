# -*- coding: utf-8 -*-
"""
Created on Wed Jul  3 14:22:19 2019

@author: Ankit Talwar
"""

#identify stops
import re
from haversine import haversine
def expected_distance(gps_lat,gps_long,gps_time,Fixed_208_lat,Fixed_208_long):
    i=0
    x=0
    y=0
    t=0
    while i < len(Fixed_208_lat):
        j=0
        k=0
        first_dist = 0
        while k<len(gps_lat):
            if not regex.match(str(gps_lat[k])):
                a=(gps_lat[k],gps_long[k])
                b=(Fixed_208_lat[i],Fixed_208_long[i])
                first_dist = haversine(a,b)
                break
            k = k+ 1
        while j< len(gps_lat):      
            if not regex.match(str(gps_lat[j])):
                c=(gps_lat[j],gps_long[j])
                d=(Fixed_208_lat[i],Fixed_208_long[i])
                minimumDistance = haversine(c,d)
                if first_dist>=minimumDistance:
                    first_dist = minimumDistance
                    x=gps_lat[j]
                    y=gps_long[j]
                    t=gps_time[j]
            j=j+1
        dlist.append(first_dist)  
        busstops_lats.append(x)
        busstops_longs.append(y)
        arrival_time_int.append(t)
    #print(dlist)    
        i=i+1
        


def distance_btwn_gps_lat_long(gps_lat,gps_long,gps_time,busstops_lats,busstops_longs):
    i=0
    de=0
    total = 0
    while i<len(busstops_lats)-1:
        d=0
        j=gps_lat.index(busstops_lats[i])
        while j<gps_lat.index(busstops_lats[i+1]):
            if not regex.match(str(gps_lat[j])):
                a = (gps_lat[j],gps_long[j])
                b = (gps_lat[j+1],gps_long[j+1])
                de = haversine(a,b)
                d=d+de        
            j=j+1
        total = total + d    
        distance_btwn_two_stops.append(d)
        total_distance.append(total)
        i=i+1
    


           

regex = re.compile(r'180+(\.\d+)')
distance_btwn_two_stops=[]
busstops_lats=[]
busstops_longs=[]
dlist=[]
minimumDistance=0    
arrival_time_int=[]
total_distance=[]
expected_distance(gps_lat,gps_long,gps_time,Fixed_208_lat,Fixed_208_long)
distance_btwn_gps_lat_long(gps_lat,gps_long,gps_time,busstops_lats,busstops_longs)

print("\n Shortest Distance between GPS route near fixed bus stops lats & longs \n\n",dlist)
print("\n GPS Bus stops latitude \n\n",busstops_lats)
print("\n GPS Bus stops longitude \n\n",busstops_longs)
print("\n Distance between bus stops \n\n",    )
print("\n Total Distance at each stop \n\n",total_distance)
print("\n Arrival time at each stop \n\n",arrival_time_int) 
distance_btwn_two_stops.insert(0,0)
total_distance.insert(0,0)
