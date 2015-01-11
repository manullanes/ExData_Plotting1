# Plot number 1

# Reading of the data set from the .txt file
powerData<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")

# Conversion the Date variables to Date classes
powerData$Time<-strptime(paste(powerData$Date,powerData$Time),format="%d/%m/%Y %H:%M:%S")
powerData$Date<-as.Date(powerData$Date,format="%d/%m/%Y")

# Subsetting of the values required
limInf<-as.Date("2007-02-01",format="%Y-%m-%d")
limSup<-as.Date("2007-02-02",format="%Y-%m-%d")
powerSub<-subset(powerData,Date>=limInf & Date<=limSup)

# Select of the column in the Subsetting Data
X<-powerSub[,3]
X<-as.matrix(X)

# Transformation to numeric values
X<-as.numeric(X)

# Opening of the Device
png(filename="plot1.png",width=480,height=480,units = "px")

# Plotting Histogram
hist(X,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# Closing of the Device
dev.off()