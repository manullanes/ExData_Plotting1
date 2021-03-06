# Plot number 3

# English Date System
Sys.setlocale("LC_TIME", "English")

# Reading of the data set from the .txt file
powerData<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")

# Conversion the Date variables to Date classes
powerData$Time<-strptime(paste(powerData$Date,powerData$Time),format="%d/%m/%Y %H:%M:%S")
powerData$Date<-as.Date(powerData$Date,format="%d/%m/%Y")

# Subsetting of the values required
limInf<-as.Date("2007-02-01",format="%Y-%m-%d")
limSup<-as.Date("2007-02-02",format="%Y-%m-%d")
powerSub<-subset(powerData,Date>=limInf & Date<=limSup)

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

# Vectors with the required values
totalX<-c(X1,X2,X3)
totalY<-c(Y,Y,Y)

# Opening of the Device
png(filename="plot3.png",width=480,height=480,units = "px",bg="transparent")

# Plotting Lines
plot(totalY,totalX,xlab="",ylab="Energy sub metering",type="n")
points(Y,X1,col="black",type="l")
points(Y,X2,col="red",type="l")
points(Y,X3,col="blue",type="l")

# Plotting Legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))

# Closing of the Device
dev.off()