# Plot number 4

# Reading of the data set from the .txt file
powerData<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")

# Conversion the Date variables to Date classes
powerData$Time<-strptime(paste(powerData$Date,powerData$Time),format="%d/%m/%Y %H:%M:%S")
powerData$Date<-as.Date(powerData$Date,format="%d/%m/%Y")

# Subsetting of the values required
limInf<-as.Date("2007-02-01",format="%Y-%m-%d")
limSup<-as.Date("2007-02-02",format="%Y-%m-%d")
powerSub<-subset(powerData,Date>=limInf & Date<=limSup)

# Opening of the Device
png(filename="plot4.png",width=480,height=480,units = "px")

# Frame for the 4 figures
par(mfrow=c(2,2))

# Figure 1
# Select of the columns in the Subsetting Data
# Transformation to numeric values
X<-powerSub[,3]
X<-as.matrix(X)
X<-as.numeric(X)
Y<-powerSub[,2]
# Plotting Line
plot(Y,X,xlab="",ylab="Global Active Power (kilowatts)",type="l")

# Figure 2
# Select of the columns in the Subsetting Data
# Transformation to numeric values
X<-powerSub[,5]
X<-as.matrix(X)
X<-as.numeric(X)
# Plotting Line
plot(Y,X,,xlab="datetime",ylab="Voltage",type="l")

# Figure 3
# Select of the columns in the Subsetting Data
# Transformation to numeric values
X1<-powerSub[,7]
X1<-as.matrix(X1)
X1<-as.numeric(X1)
X2<-powerSub[,8]
X2<-as.matrix(X2)
X2<-as.numeric(X2)
X3<-powerSub[,9]
X3<-as.matrix(X3)
X3<-as.numeric(X3)
Y<-powerSub[,2]
totalX<-c(X1,X2,X3)
totalY<-c(Y,Y,Y)
# Plotting Lines
plot(totalY,totalX,xlab="",ylab="Energy sub metering",type="n")
points(Y,X1,col="black",type="l")
points(Y,X2,col="red",type="l")
points(Y,X3,col="blue",type="l")
# Plotting Legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"),bty="n")

# Figure 4
# Select of the columns in the Subsetting Data
# Transformation to numeric values
X<-powerSub[,4]
X<-as.matrix(X)
X<-as.numeric(X)
# PLotting Line
plot(Y,X,,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()