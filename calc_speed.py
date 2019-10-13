# -*- coding: utf-8 -*-
"""
Created on Thu Jun 27 16:36:55 2019

@author: Ankit Talwar
"""

#distance


def calc_speed(dist,time):
    try:
        for i in range(1,len(dist)):
            if dist[i]!=0:
                if dist[i]/time[i]!=0:
                    speed.append(dist[i]/time[i])
            else:
                speed.append(0)
        
    except ZeroDivisionError as error:
        pass
    except Exception as exception:
        pass
    

speed=[]
calc_speed(distance_btwn_two_stops,calc_time_in_hrs)
speed.insert(0,0)

print(len(distance_btwn_two_stops))
print(len(calc_time_in_hrs))
print(len(speed))
print("\n Distance between bus stops \n",distance_btwn_two_stops)
print("\n Time in calc in hrs at each stop \n",calc_time_in_hrs)
print("\n Calc speed between each stop\n",speed)
a=0
for i in speed:
    a=a+i

b=a/37
print("\n avg speed for whole trip :", b)