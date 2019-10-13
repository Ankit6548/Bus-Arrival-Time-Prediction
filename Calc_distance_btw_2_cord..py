# -*- coding: utf-8 -*-
"""
Created on Tue Jun 25 00:38:47 2019

@author: Ankit Talwar
"""

from math import sin, cos, sqrt, atan2, radians

"""
def Calc_Dist_Btwn_Stops(lat1,lon1,lat2,lon2):
    # approximate radius of earth in km
    R = 6371.0
    latitude1 = lat1
    longitude1 = lon1
    latitude2 = lat2
    longitude2 =lon2
    dlon = radians(longitude2 - longitude1)
    dlat = radians(latitude2 - latitude1)
    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R*c
"""
def Calculated_Dist_list(lat,long):
    i=0
   
    while i <len(lat)-1:   
        a=lat[i]
        b=long[i]
        c=lat[i+1]
        d=long[i+1]
        distance.append(Calc_Dist_Btwn_Stops(a,b,c,d))
        i+=1
    return distance
distance=[]
#print(lat[0:50])
Calculated_Dist_list(lat,long)
distance.insert(0,0)

print(distance[0:100])




def total_distance():
    total_distance=0
    for i in range(1,len(distance)):
        total_distance=total_distance+distance[i];
    return total_distance

total_distance()
print(Calc_Dist_Btwn_Stops(51.874596388888904,-8.538466388888889,51.8756016666667,-8.53568944444445))


