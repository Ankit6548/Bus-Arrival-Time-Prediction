
def convert_Arr_time_str_to_int(arrival_time):
    for i in arrival_time:
        HH=int(i[13:15])
        MM=int(i[16:18])
        SS=int(i[19:21])
        Secs=HH*3600+MM*60+SS
        time_int.append(Secs)
    return time_int

def convert_real_arr_time_str_to_int(real_time):
    for i in real_time:
        HH=int(i[0:2])
        MM=int(i[3:5])
        SS=int(i[6:8])
        Secs=HH*3600+MM*60+SS
        real_time_in_secs.append(Secs)
    return  

#print(convert_Arr_time_str_to_int(arrival_time))
#print(convert_dep_time_str_to_int(departure_time))

def calc_time_between_stops(arr_time):
    i=0
    while i<len(arr_time)-1:
        Calc_time_in_secs.append(arr_time[i+1]-arr_time[i])
        i=i+1
    return Calc_time_in_secs

    
time_int=[]
Calc_time_in_secs=[]
real_time_in_secs=[]
calc_time_between_stops(convert_Arr_time_str_to_int(arrival_time_int))
convert_real_arr_time_str_to_int(Fixed_208_timing)
print(time_int)
print(Calc_time_in_secs)

print(arrival_time_int)
print(Fixed_208_timing)
print(real_time_in_secs)
Calc_time_in_secs.insert(0,0)
#print(len(Calc_time_in_secs))

calc_time_in_hrs=[]

for i in Calc_time_in_secs:
    calc_time_in_hrs.append(i*0.000277778)
print(calc_time_in_hrs[0:50])


#------------------------------check for delay time--------------------
delay=[]
for i in range(len(real_time_in_secs)):
    d=real_time_in_secs[i]-time_int[i]
    delay.append(d)
print("\n delayed at each stop \n",delay)
print("\n delayed by minutes:", delay[-1]/60)
#------------------------------check for total time taken to reach each stop--------------------
tot_time_at_each_stop=[]
t=0
for i in Calc_time_in_secs:
    t=t+i
    tot_time_at_each_stop.append(t)
print(tot_time_at_each_stop)
tot_time_at_each_stop[-1]/60