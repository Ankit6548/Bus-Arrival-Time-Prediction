###########################################################################################
####------------------------------ LOAD R LIBRARIES------------------------------------####
###########################################################################################
library(neuralnet)
library(nnet)
library(NeuralNetTools)
library(TSPred)
#install.packages("TSPred")
library(caTools) # sample.split
library(Metrics)
library(BBmisc)
#install.packages("BBmisc")

###########################################################################################
####---------------------------- FUNCTION DEFINATIONS----------------------------------####
####                                                                                   ####
#### Function created to scale the data in the dataframe.                              ####
#### Function created to check the last visited stop in current trip  data             ####
####                                                                                   ####
###########################################################################################
normalizescale_dataframe<-function(wholetrip){
  wholetrip.scaled <- as.data.frame(scale(wholetrip))
  wholetrip.scaled[is.na(wholetrip.scaled)]<-0
  return(wholetrip.scaled)
}

normalize <- function(data) {
  return ((data - min(data))/(max(data) - min(data)))
}

#(-1 + 2*(data - min(data))/(max(data) - min(data)))

check_last_stop<-function(current){
  till_col<-0
  rowno<-nrow(current)
  colno<-ncol(current)
  for (i in 1:colno){
    if((current[rowno,i]=="0" & (current[rowno,i+1])=="0")) {
      
      #print(i-1)
      till_col<-i-1
      break
    }}
  return(till_col)
}
sigmoid <- function(x) {
  1.0 / (1.0 + exp(-x))
}
###########################################################################################
####------------------------------ LOAD TRIP DATA -------------------------------------####
###########################################################################################

wholetrip_All<-rbind(trip1,trip2,trip3,trip5,trip6,trip7,trip8,trip10,trip11,
                     trip13,trip15,trip16,trip17,trip18,trip21,
                     trip23,trip24,trip25,trip26,trip27,trip28,trip29,
                     trip32,trip33,trip35,trip36,trip37,trip38,
                     trip39,trip41,trip42,trip43,trip45,trip46,trip47,
                     trip48,trip49,trip50,trip51,trip52,trip54,
                     trip57,trip58,trip59,trip60,trip61,trip62,
                     trip64,trip65)

#,trip44,trip4,trip12,trip56,trip63,trip30
#dim(wholetrip.test)
wholetrip_All$type<-as.factor(wholetrip_All$type)
bus_data<-wholetrip_All[wholetrip_All$type == "A", ]
#bus_data<-wholetrip_All
#bus_data<-bus_data[bus_data$Stop36<='2600',]
rownames(bus_data)<-NULL
#summary(bus_data)
###########################################################################################
####---------------SPLITING THE DATA INTO TRAINING AND TESTING DATA -------------------####
###########################################################################################

seed.val<-2
set.seed(seed.val)
bus_data$type<-NULL
sample <- sample.int(n = nrow(bus_data), size = floor(.75*nrow(bus_data)), replace = F)
wholetrip.train <- bus_data[sample, ]
wholetrip.test  <- bus_data[-sample, ]
#a_test<-wholetrip.test[3,]
#wholetrip.test<-a_test
#boxplot(wholetrip.test$Stop36)
#summary(wholetrip.train)
#summary(wholetrip.test)
#par(mfrow=c(1,1))
#-----------------
plot(wholetrip_All$Stop36,wholetrip_All$speed, pch=16, main="Time taken for bus to reach last stop with respect to speed"
     , xlab="Time(Secs)",
     ylab="Average speed(Km/hr) ",cex.lab=1.5,cex.axis=1.5, cex.main=1.5)

Check.lm<-lm(Stop36~speed,data = bus_data)
summary(Check.lm)
#plot(Check.lm)


#-----------------
#cor(wholetrip_All$Stop36,wholetrip_All$speed)
#?neuralnet
###########################################################################################
####---------------CREATING RANDOM CURRENT TRIPS FROM TEST DATA -----------------------####
###########################################################################################
#dim(wholetrip.test)
current<-as.data.frame(wholetrip.test)
current[,1:38]<-0
for (i in 1:nrow(wholetrip.test)){
  random_obervation<-sample(6:20, 1, replace=FALSE)
  current[i,]<-wholetrip.test[i,]
  current[i,random_obervation:37]<-0
}

#a_current<-current

###########################################################################################
####------CREATING PREDICTED DATAFRAME TO STORE THE VALUES FROM THE MODEL -------------####
###########################################################################################

predicted <- data.frame(matrix(ncol = 38, nrow = nrow(wholetrip.test)))
x <-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
      "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
      "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
      "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
      "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36","speed")
colnames(predicted) <- x

###########################################################################################
####------UPDATING PREDICTED DATAFRAME WITH CURRENT TRIP DATA AND PREDICTED------------#### 
###---------------- VALUES FOR UPSTREAM BUS STOPS FROM ANN MODEL-----------------------####
###########################################################################################
for(k in 1:nrow(current)){
  predicted[k,]<-current[k,]
  till_col=check_last_stop(predicted[k,])
  Pred_col=till_col+1
  wholetrip.train.scaled<-normalize(wholetrip.train)
  wholetrip.test.scaled<-normalize(wholetrip.test)
  rowno<-nrow(wholetrip.train.scaled)
  colno<-ncol(wholetrip.train.scaled)-1
  
  print(paste("#### CURRRENT TEST TRIP  #####",k))
  for (i in 1:(colno-till_col)){
    j=Pred_col-5
    f   <- as.formula(paste(names(wholetrip.train.scaled[Pred_col]),"~",
                            paste(names(wholetrip.train.scaled[j:till_col]),
                                  collapse   =   "   +   "),paste("+ speed")))
    #print(f)
    wholetrip.nn <- neuralnet(f, data=wholetrip.train.scaled
                              ,hidden=2
                              ,algorithm = "backprop"
                              ,learningrate=0.01
                              ,err.fct = 'sse'
                              ,act.fct = sigmoid
                              ,linear.output=FALSE)
    wholetrip.nn.scaled <- neuralnet::compute(wholetrip.nn, wholetrip.test.scaled[k,c(j:till_col,ncol(wholetrip.test))])
    wholetrip.nn.unscaled <- wholetrip.test[k,Pred_col]
    #print(paste0("Actual value for stop ", Pred_col-1," : " ,wholetrip.nn.unscaled))
    wholetrip.nn.pred <- wholetrip.nn.scaled$net.result*(max(wholetrip.train[,Pred_col])
                                                         -min(wholetrip.train[,Pred_col]))+min(wholetrip.train[,Pred_col])
    #print(paste0("Predicted value for stop ", Pred_col-1," : " ,round(wholetrip.nn.pred,digits=2)))
    #plot(wholetrip.nn)
    #Updating predicted value inthe dataframe
    predicted[k,Pred_col]=round(wholetrip.nn.pred,digits=2)
    till_col=till_col+1
    Pred_col=Pred_col+1
  }
}



######################################################################################
####--------------- CALCULATE MAPE AND SMAPE ERROR--------------------------------####
######################################################################################
Mape<-numeric(nrow(current))
sMape<-numeric(nrow(current))
for(p in 1:nrow(current)){
  till_col=check_last_stop(current[p,])
  Pred_col=till_col+1
  actual<-wholetrip.test[p,Pred_col:37]
  prediction<-predicted[p,Pred_col:37]
  Mape[p]<-rowMeans(abs((actual-prediction)/actual) * 100)
  sMape[p]<-sMAPE(actual,prediction)
} 

Mape<-as.data.frame(Mape)
sMape<-as.data.frame(sMape)
Mape
sMape
######################################################################################
####------- PLOTTING GRAPHS OF TIME TAKEN BETWEEN EACH STOP-----------------------#### 
####-------- ACTUAL AND PREDICTED VALUES FOR TRIPS--------------------------------####
####------------------------------------------------------------------------------####
######################################################################################
par(mfrow=c(nrow(current)/2,2))

par(mfrow=c(1,1))
for(p in 1:nrow(current)){
  till_col=check_last_stop(current[p,])
  Pred_col=till_col+1
  actual<-wholetrip.test[p,Pred_col:37]
  t1<-numeric(length(actual))
  for ( i in 1:length(actual)-1 ){
    t1[i]<-actual[,i+1]-actual[,i]
  }
  actual<-as.data.frame(as.numeric(t(t1)))
  prediction<-predicted[p,Pred_col:37]
  t1<-numeric(length(prediction))
  for ( i in 1:length(prediction)-1 ){
    t1[i]<-prediction[,i+1]-prediction[,i]
  }
  prediction<-as.data.frame(as.numeric(t(t1)))
  plot(Pred_col:37,t(prediction), col='blue', "o",lty=2,pch=15,lwd=2,xlim = c(Pred_col,37),
       ylim = c(min(prediction,actual),max(prediction,actual)),
       xlab="Bus Stops",ylab="Time taken(sec)",main=p,cex.lab=1.5,cex.axis=1,cex.main=1.5)
  axis(1,at=1:37)
  #axis(2,at=c(250,750,1250,1750,2250,2750,3250,3750))
  lines(Pred_col:37,t(actual), col='red',"o",pch=24,lwd=2,lty=1)
  legend("topright" , legend=c("GPS Real Time", "ANN Predicted Time"),
         col=c("red", "blue"), lty=1:2, cex=0.9,box.lty=1,text.font = 2)
  mtext("Bus travel Time(secs) at each stop for trips 1 to 6",line=-1, outer = TRUE)
}


######################################################################################
####------- PLOTTING THE GRAPHS OF ACTUAL AND PREDICTED VALUES FOR TRIPS----------####
######################################################################################
par(mfrow=c(nrow(current)/2,2))

par(las=1)
for(p in 1:nrow(current)){
  till_col=check_last_stop(current[p,])
  Pred_col=till_col+1
  actual<-wholetrip.test[p,Pred_col:37]
  prediction<-predicted[p,Pred_col:37]
  plot(Pred_col:37,prediction, col='blue', "o",lty=2,pch=15,lwd=2,xlim = c(Pred_col,37),
       ylim = c(min(prediction,actual),max(prediction,actual)),
       xlab="Bus Stops",ylab="Time(secs)",main=p,cex.lab=1.5,cex.axis=1,cex.main=1.5)
  
  axis(1,at=1:37)
  axis(2,at=c(250,750,1250,1750,2250,2750,3250,3750))
  lines(Pred_col:37,actual, col='red',"o",pch=24,lwd=2,lty=1)
  legend("bottomright", legend=c("GPS Real Time", "ANN Predicted"), 
         col=c("red", "blue"), lty=1:2, cex=1,box.lty=1,text.font = 2)
  mtext("Bus stops vs Time(secs) taken for trips 1 to 6",line=-1, outer = TRUE)
  
}

######################################################################################
####--- PLOTTING GRAPHS OF MAPE CALCUATED AT EACH BUS STOP FOR PREDICTED VALUES --####
######################################################################################
par(mfrow=c(nrow(current)-1,2))
colour<-rainbow(nrow(current))
for(p in 1:nrow(current)){
  Mape<-numeric(nrow(current))
  till_col=check_last_stop(current[p,])
  Pred_col=till_col+1
  actual<-wholetrip.test[p,Pred_col:37]
  prediction<-predicted[p,Pred_col:37]
  Mape<-abs((actual-prediction)/actual) * 100
  plot(Pred_col:37,Mape, col=colour[p], "o",lty=1,pch=15,lwd=2,
       xlab="Stops",ylab="Mape %",ylim = c(1,max(Mape)+5),
       main="MAPE% CALCUATED AT EACH BUS STOP FOR PREDICTED VALUES")
  axis(1,at=1:37)
}
######################################################################################
####----------------- PLOTTING GRAPHS OF R2 CALCUATED ------------------------- --####
######################################################################################
par(mfrow=c(nrow(current)-1,2))
colour<-rainbow(nrow(current))
for(p in 1:nrow(current)){
  Mape<-numeric(nrow(current))
  till_col=check_last_stop(current[p,])
  Pred_col=till_col+1
  actual<-wholetrip.test[p,Pred_col:37]
  prediction<-predicted[p,Pred_col:37]
  act<-as.numeric(actual)
  pre<-as.numeric(prediction)
  DFS <- data.frame(VAR1=act, VAR2=pre)
  with(DFS, plot(VAR1, VAR2, pch=20,xlab="Actual values",ylab = "Predicted Values",
                 main = "R sq. value"))
  abline(fit <- lm(VAR2 ~ VAR1, data=DFS), col='red')
  legend("topleft", bty="n", cex=0.9,box.lty=1,text.font = 2, 
         legend=paste("R2 is",format(summary(fit)$adj.r.squared, digits=4)))
}
par(mfrow=c(1,1))

######################################################################################
####---CREATING A NEW MATRIX OF ACTUAL - PREDICTED VALUES AND CALCULATING RMSE ---####
######################################################################################
rmse.df <- data.frame(matrix(ncol = 37, nrow = nrow(wholetrip.test)))
y <-c("Stop0","Stop1","Stop2","Stop3","Stop4","Stop5","Stop6","Stop7",
      "Stop8","Stop9","Stop10","Stop11","Stop12","Stop13","Stop14","Stop15",
      "Stop16","Stop17","Stop18","Stop19","Stop20","Stop21","Stop22",
      "Stop23","Stop24","Stop25","Stop26","Stop27","Stop28","Stop29",
      "Stop30","Stop31","Stop32","Stop33","Stop34","Stop35","Stop36")
colnames(rmse.df) <- y
rmse.df$rmse<-0
rmse.df$mae<-0
rmse.df$R.Sq<-0
rsq <- function (x, y) cor(x, y) ^ 2
for(p in 1:nrow(current)){
  #Mape<-numeric(nrow(current))
  till_col=check_last_stop(current[p,])
  Pred_col=till_col+1
  actual<-wholetrip.test[p,Pred_col:37]
  prediction<-predicted[p,Pred_col:37]
  q<-Pred_col
  for (i in 1:ncol(actual)){
    if(q==38){
      break}
    rmse.df[p,q]<-round((actual[,i]-prediction[,i])/60,digits=2)
    q=q+1
  }
  act<-as.numeric(actual)
  pre<-as.numeric(prediction)
  rmse.df[p,38]<-round(rmse(act,pre),digits = 2)
  rmse.df[p,39]<-round(mae(act,pre),digit=2)
  rmse.df[p,40]<-rsq(act,pre)
}


rmse.df[is.na(rmse.df)] <- '-'
rmse.df




######################################################################################
######################################################################################
gg_bus_data<-bus_data
gg_bus_data$id = rownames(gg_bus_data)
library(reshape2)    
library(ggplot2)
mm = melt(gg_bus_data, id='id')
ggplot(mm)+geom_line(aes(x=variable, y=value, group=id, color=id))

#for (j in Pred_col:colno){
# wholetrip.train[rowno,j]<-(sum(wholetrip.train[,j])/(rowno-1))
#}



######################################################################################
######################################################################################
T_df1<-data.frame(matrix(ncol = 3))
T_df<-data.frame(matrix(ncol = 3))

for(p in 1:nrow(current)){
  till_col=check_last_stop(current[p,])
  Pred_col=till_col+1
  actual<-cbind(wholetrip.test[p,Pred_col:37],wholetrip.test[p,38])
  prediction<-cbind(predicted[p,Pred_col:37],wholetrip.test[p,38])
  speed<-actual[,ncol(actual)]
  actual<-as.numeric(actual[,-ncol(actual)])
  prediction<-as.numeric(prediction[,-ncol(prediction)])
  
  for(i in 1:length(actual))
  {
  T_df1[i,1]<-actual[i]
  T_df1[i,2]<-prediction[i]
  T_df1[i,3]<-speed
  }
  T_df<-rbind(T_df,T_df1)
}
T_df<-na.omit(T_df)

colnames(T_df)<-c("Actual","Predicted","Speed")
par(mfrow=c(1,1))
plot(T_df$Predicted,T_df$Actual, main="Actual vs Predicted"
     , xlab="Actual Time(Secs)",
     ylab="Predicted Time(Secs)", pch=c(16,2))

Check_whole.lm<-lm(Predicted~Actual+Speed,data = T_df)
abline(Check_whole.lm)
summary(Check_whole.lm)
plot(Check_whole.lm)

