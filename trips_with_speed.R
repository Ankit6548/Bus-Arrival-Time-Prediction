###########################################################################################
####----------------------------- LOAD TRIPS DATA -------------------------------------####
###########################################################################################

####---------------------------------- TRIP 1------------------------------------------####

df<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip1.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df)<-cols
df<-df[,3:4]
trip1<-t(df[,1])
trip1<-as.data.frame(trip1)
colnames(trip1)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                   "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                   "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                   "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                   "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip1$type<-'A'
trip1$speed<-mean(df[,2])
####---------------------------------- TRIP 2------------------------------------------####

df2<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip2.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df2)<-cols

df2<-df2[,3:4]


trip2<-t(df2[,1])
trip2<-as.data.frame(trip2)
colnames(trip2)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                   "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                   "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                   "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                   "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip2$type<-'A'
trip2$speed<-mean(df2[,2])
####---------------------------------- TRIP 3------------------------------------------####

df3<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip3.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df3)<-cols

df3<-df3[,3:4]


trip3<-t(df3[,1])
trip3<-as.data.frame(trip3)
colnames(trip3)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                   "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                   "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                   "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                   "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip3$type<-'B'
trip3$speed<-mean(df3[,2])
####---------------------------------- TRIP 4------------------------------------------####

df4<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip4.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df4)<-cols

df4<-df4[,3:4]


trip4<-t(df4[,1])
trip4<-as.data.frame(trip4)
colnames(trip4)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                   "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                   "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                   "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                   "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip4$type<-'A'
trip4$speed<-mean(df4[,2])
####---------------------------------- TRIP 5------------------------------------------####

df5<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip5.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df5)<-cols

df5<-df5[,3:4]


trip5<-t(df5[,1])
trip5<-as.data.frame(trip5)
colnames(trip5)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                   "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                   "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                   "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                   "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip5$type<-'A'
trip5$speed<-mean(df5[,2])
####---------------------------------- TRIP 6------------------------------------------####

df6<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip6.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df6)<-cols

df6<-df6[,3:4]


trip6<-t(df6[,1])
trip6<-as.data.frame(trip6)
colnames(trip6)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                   "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                   "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                   "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                   "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip6$type<-'C'
trip6$speed<-mean(df6[,2])


####---------------------------------- TRIP 7------------------------------------------####


df7<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip7.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df7)<-cols

df7<-df7[,3:4]


trip7<-t(df7[,1])
trip7<-as.data.frame(trip7)
colnames(trip7)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                   "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                   "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                   "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                   "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip7$type<-'A'
trip7$speed<-mean(df7[,2])
####---------------------------------- TRIP 8------------------------------------------####

df8<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip8.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df8)<-cols

df8<-df8[,3:4]


trip8<-t(df8[,1])
trip8<-as.data.frame(trip8)
colnames(trip8)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                   "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                   "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                   "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                   "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip8$type<-'A'
trip8$speed<-mean(df8[,2])
####--------------------------------- TRIP 10------------------------------------------####

df10<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip10.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df10)<-cols

df10<-df10[,3:4]


trip10<-t(df10[,1])
trip10<-as.data.frame(trip10)
colnames(trip10)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip10$type<-'C'
trip10$speed<-mean(df10[,2])
####--------------------------------- TRIP 11------------------------------------------####

df11<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip11.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df11)<-cols

df11<-df11[,3:4]


trip11<-t(df11[,1])
trip11<-as.data.frame(trip11)
colnames(trip11)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip11$type<-'A'
trip11$speed<-mean(df11[,2])
####--------------------------------- TRIP 12------------------------------------------####

df12<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip12.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df12)<-cols

df12<-df12[,3:4]


trip12<-t(df12[,1])
trip12<-as.data.frame(trip12)
colnames(trip12)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip12$type<-'A'
trip12$speed<-mean(df12[,2])
####--------------------------------- TRIP 13------------------------------------------####

df13<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip13.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df13)<-cols

df13<-df13[,3:4]


trip13<-t(df13[,1])
trip13<-as.data.frame(trip13)
colnames(trip13)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip13$type<-'B'
trip13$speed<-mean(df13[,2])
####--------------------------------- TRIP 15------------------------------------------####

df15<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip15.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df15)<-cols

df15<-df15[,3:4]


trip15<-t(df15[,1])
trip15<-as.data.frame(trip15)
colnames(trip15)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip15$type<-'B'
trip15$speed<-mean(df15[,2])
####--------------------------------- TRIP 16------------------------------------------####

df16<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip16.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df16)<-cols

df16<-df16[,3:4]


trip16<-t(df16[,1])
trip16<-as.data.frame(trip16)
colnames(trip16)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip16$type<-'C'
trip16$speed<-mean(df16[,2])
####--------------------------------- TRIP 17------------------------------------------####

df17<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip17.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df17)<-cols

df17<-df17[,3:4]


trip17<-t(df17[,1])
trip17<-as.data.frame(trip17)
colnames(trip17)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip17$type<-'C'
trip17$speed<-mean(df17[,2])
####--------------------------------- TRIP 18------------------------------------------####

df18<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip18.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df18)<-cols

df18<-df18[,3:4]


trip18<-t(df18[,1])
trip18<-as.data.frame(trip18)
colnames(trip18)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip18$type<-'C'
trip18$speed<-mean(df18[,2])
####--------------------------------- TRIP 21------------------------------------------####

df21<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip21.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df21)<-cols

df21<-df21[,3:4]


trip21<-t(df21[,1])
trip21<-as.data.frame(trip21)
colnames(trip21)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip21$type<-'C'
trip21$speed<-mean(df21[,2])
####--------------------------------- TRIP 23------------------------------------------####

df23<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip23.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df23)<-cols

df23<-df23[,3:4]


trip23<-t(df23[,1])
trip23<-as.data.frame(trip23)
colnames(trip23)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip23$type<-'A'
trip23$speed<-mean(df23[,2])
####--------------------------------- TRIP 24------------------------------------------####
df24<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip24.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df24)<-cols

df24<-df24[,3:4]
trip24<-t(df24[,1])
trip24<-as.data.frame(trip24)
colnames(trip24)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip24$type<-'A'
trip24$speed<-mean(df24[,2])
####--------------------------------- TRIP 25------------------------------------------####

df25<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip25.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df25)<-cols

df25<-df25[,3:4]


trip25<-t(df25[,1])
trip25<-as.data.frame(trip25)
colnames(trip25)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip25$type<-'B'
trip25$speed<-mean(df25[,2])
####--------------------------------- TRIP 26------------------------------------------####

df26<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip26.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df26)<-cols

df26<-df26[,3:4]


trip26<-t(df26[,1])
trip26<-as.data.frame(trip26)
colnames(trip26)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip26$type<-'B'
trip26$speed<-mean(df26[,2])
####--------------------------------- TRIP 27------------------------------------------####

df27<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip27.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df27)<-cols

df27<-df27[,3:4]


trip27<-t(df27[,1])
trip27<-as.data.frame(trip27)
colnames(trip27)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip27$type<-'B'
trip27$speed<-mean(df27[,2])
####--------------------------------- TRIP 28------------------------------------------####

df28<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip28.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df28)<-cols

df28<-df28[,3:4]


trip28<-t(df28[,1])
trip28<-as.data.frame(trip28)
colnames(trip28)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip28$type<-'C'
trip28$speed<-mean(df28[,2])
####--------------------------------- TRIP 29------------------------------------------####

df29<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip29.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df29)<-cols

df29<-df29[,3:4]


trip29<-t(df29[,1])
trip29<-as.data.frame(trip29)
colnames(trip29)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip29$type<-'B'
trip29$speed<-mean(df29[,2])
####--------------------------------- TRIP 30------------------------------------------####

df30<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip30.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df30)<-cols

df30<-df30[,3:4]


trip30<-t(df30[,1])
trip30<-as.data.frame(trip30)
colnames(trip30)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")
trip30$type<-'A'
trip30$speed<-mean(df30[,2])
####--------------------------------- TRIP 32------------------------------------------####

df32<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip32.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df32)<-cols

df32<-df32[,3:4]


trip32<-t(df32[,1])
trip32<-as.data.frame(trip32)
colnames(trip32)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip32$type<-'A'
trip32$speed<-mean(df32[,2])
####--------------------------------- TRIP 33------------------------------------------####

df33<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip33.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df33)<-cols

df33<-df33[,3:4]


trip33<-t(df33[,1])
trip33<-as.data.frame(trip33)
colnames(trip33)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip33$type<-'B'
trip33$speed<-mean(df33[,2])
####--------------------------------- TRIP 35------------------------------------------####

df35<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip35.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df35)<-cols

df35<-df35[,3:5]


trip35<-t(df35[,1])
trip35<-as.data.frame(trip35)
colnames(trip35)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip35$type<-'A'
trip35$speed<-mean(df35[,2])
####--------------------------------- TRIP 36------------------------------------------####

df36<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip36.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df36)<-cols

df36<-df36[,3:4]


trip36<-t(df36[,1])
trip36<-as.data.frame(trip36)
colnames(trip36)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip36$type<-'A'
trip36$speed<-mean(df36[,2])
####--------------------------------- TRIP 37------------------------------------------####

df37<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip37.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df37)<-cols

df37<-df37[,3:4]


trip37<-t(df37[,1])
trip37<-as.data.frame(trip37)
colnames(trip37)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip37$type<-'A'
trip37$speed<-mean(df37[,2])
####--------------------------------- TRIP 38------------------------------------------####

df38<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip38.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df38)<-cols

df38<-df38[,3:4]


trip38<-t(df38[,1])
trip38<-as.data.frame(trip38)
colnames(trip38)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip38$type<-'B'
trip38$speed<-mean(df38[,2])
####--------------------------------- TRIP 39------------------------------------------####

df39<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip39.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df39)<-cols

df39<-df39[,3:4]


trip39<-t(df39[,1])
trip39<-as.data.frame(trip39)
colnames(trip39)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip39$type<-'B'
trip39$speed<-mean(df39[,2])
####--------------------------------- TRIP 41------------------------------------------####

df41<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip41.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df41)<-cols

df41<-df41[,3:4]


trip41<-t(df41[,1])
trip41<-as.data.frame(trip41)
colnames(trip41)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip41$type<-'C'
trip41$speed<-mean(df41[,2])
####--------------------------------- TRIP 42------------------------------------------####

df42<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip42.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df42)<-cols

df42<-df42[,3:4]


trip42<-t(df42[,1])
trip42<-as.data.frame(trip42)
colnames(trip42)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip42$type<-'C'
trip42$speed<-mean(df42[,2])
####--------------------------------- TRIP 43------------------------------------------####

df43<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip43.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df43)<-cols

df43<-df43[,3:4]


trip43<-t(df43[,1])
trip43<-as.data.frame(trip43)
colnames(trip43)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip43$type<-'A'
trip43$speed<-mean(df43[,2])
####--------------------------------- TRIP 44------------------------------------------####

df44<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip44.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df44)<-cols

df44<-df44[,3:4]


trip44<-t(df44[,1])
trip44<-as.data.frame(trip44)
colnames(trip44)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip44$type<-'A'
trip44$speed<-mean(df44[,2])
####--------------------------------- TRIP 45------------------------------------------####

df45<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip45.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df45)<-cols

df45<-df45[,3:4]


trip45<-t(df45[,1])
trip45<-as.data.frame(trip45)
colnames(trip45)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip45$type<-'B'
trip45$speed<-mean(df45[,2])
####--------------------------------- TRIP 46------------------------------------------####

df46<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip46.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df46)<-cols

df46<-df46[,3:4]


trip46<-t(df46[,1])
trip46<-as.data.frame(trip46)
colnames(trip46)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip46$type<-'A'
trip46$speed<-mean(df46[,2])
####--------------------------------- TRIP 47------------------------------------------####

df47<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip47.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df47)<-cols

df47<-df47[,3:4]


trip47<-t(df47[,1])
trip47<-as.data.frame(trip47)
colnames(trip47)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip47$type<-'A'
trip47$speed<-mean(df47[,2])
####--------------------------------- TRIP 48------------------------------------------####

df48<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip48.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df48)<-cols

df48<-df48[,3:4]

trip48<-t(df48[,1])
trip48<-as.data.frame(trip48)
colnames(trip48)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip48$type<-'B'
trip48$speed<-mean(df48[,2])
####--------------------------------- TRIP 49------------------------------------------####

df49<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip49.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df49)<-cols

df49<-df49[,3:4]

trip49<-t(df49[,1])
trip49<-as.data.frame(trip49)
colnames(trip49)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip49$type<-'A'
trip49$speed<-mean(df49[,2])

####--------------------------------- TRIP 50------------------------------------------####

df50<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip50.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df50)<-cols

df50<-df50[,3:4]

trip50<-t(df50[,1])
trip50<-as.data.frame(trip50)
colnames(trip50)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip50$type<-'A'
trip50$speed<-mean(df50[,2])
####--------------------------------- TRIP 51------------------------------------------####

df51<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip51.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df51)<-cols

df51<-df51[,3:4]

trip51<-t(df51[,1])
trip51<-as.data.frame(trip51)
colnames(trip51)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip51$type<-'B'
trip51$speed<-mean(df51[,2])
####--------------------------------- TRIP 52------------------------------------------####

df52<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip52.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df52)<-cols

df52<-df52[,3:4]

trip52<-t(df52[,1])
trip52<-as.data.frame(trip52)
colnames(trip52)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip52$type<-'A'
trip52$speed<-mean(df52[,2])

####--------------------------------- TRIP 54------------------------------------------####

df54<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip54.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df54)<-cols

df54<-df54[,3:4]

trip54<-t(df54[,1])
trip54<-as.data.frame(trip54)
colnames(trip54)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip54$type<-'B'
trip54$speed<-mean(df54[,2])

####--------------------------------- TRIP 56------------------------------------------####

df56<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip56.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df56)<-cols

df56<-df56[,3:4]

trip56<-t(df56[,1])
trip56<-as.data.frame(trip56)
colnames(trip56)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip56$type<-'A'
trip56$speed<-mean(df56[,2])
####--------------------------------- TRIP 57------------------------------------------####

df57<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip57.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df57)<-cols

df57<-df57[,3:4]

trip57<-t(df57[,1])
trip57<-as.data.frame(trip57)
colnames(trip57)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip57$type<-'A'
trip57$speed<-mean(df57[,2])
####--------------------------------- TRIP 58------------------------------------------####

df58<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip58.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df58)<-cols

df58<-df58[,3:4]

trip58<-t(df58[,1])
trip58<-as.data.frame(trip58)
colnames(trip58)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip58$type<-'A'
trip58$speed<-mean(df58[,2])
####--------------------------------- TRIP 59------------------------------------------####

df59<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip59.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df59)<-cols

df59<-df59[,3:4]

trip59<-t(df59[,1])
trip59<-as.data.frame(trip59)
colnames(trip59)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip59$type<-'B'
trip59$speed<-mean(df59[,2])
####--------------------------------- TRIP 60------------------------------------------####

df60<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip60.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df60)<-cols

df60<-df60[,3:4]

trip60<-t(df60[,1])
trip60<-as.data.frame(trip60)
colnames(trip60)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip60$type<-'B'
trip60$speed<-mean(df60[,2])
####--------------------------------- TRIP 61------------------------------------------####

df61<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip61.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df61)<-cols

df61<-df61[,3:4]

trip61<-t(df61[,1])
trip61<-as.data.frame(trip61)
colnames(trip61)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip61$type<-'B'
trip61$speed<-mean(df61[,2])
####--------------------------------- TRIP 62------------------------------------------####

df62<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip62.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df62)<-cols

df62<-df62[,3:4]

trip62<-t(df62[,1])
trip62<-as.data.frame(trip62)
colnames(trip62)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip62$type<-'B'
trip62$speed<-mean(df62[,2])
####--------------------------------- TRIP 63------------------------------------------####

df63<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip63.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df63)<-cols

df63<-df63[,3:4]

trip63<-t(df63[,1])
trip63<-as.data.frame(trip63)
colnames(trip63)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip63$type<-'A'
trip63$speed<-mean(df63[,2])
####--------------------------------- TRIP 64------------------------------------------####

df64<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip64.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df64)<-cols

df64<-df64[,3:4]

trip64<-t(df64[,1])
trip64<-as.data.frame(trip64)
colnames(trip64)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip64$type<-'A'
trip64$speed<-mean(df64[,2])
####--------------------------------- TRIP 65------------------------------------------####

df65<-read.csv("C:\\Users\\Ankit Talwar\\dist_time_speed_208_trip65.txt",header=TRUE)
cols<-c("distance_btwn_two_stops","total_distance","tot_time_at_each_stop","speed","delay")
colnames(df65)<-cols

df65<-df65[,3:4]

trip65<-t(df65[,1])
trip65<-as.data.frame(trip65)
colnames(trip65)<-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
                    "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
                    "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
                    "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
                    "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")

trip65$type<-'B'
trip65$speed<-mean(df65[,2])
