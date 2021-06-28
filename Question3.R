library(readxl)
#read data from file location
vaccine<-read_xlsx("C:/Users/USER/Downloads/COVID-19 County Vaccine Data.xlsx")
#calculate how many N/A values, if false, then no N/A values, total number is 414.
table(is.na(vaccine))
#there is a -1 in the dataset, i think it is not right, I need to delete -1.
vaccine$`Population > 16`[which(vaccine$`Population > 16`<=16)]=NA;
#is.na(vaccine)
#omit n/a values
Vaccine<-na.omit(vaccine)
#calculate the completed rate
Vaccine$completed_rate<-as.numeric(Vaccine$`People Completely Vaccinated`)/as.numeric(Vaccine$`Population > 16`)
#plot the completed rate
plot(Vaccine$completed_rate,type="o",xlab = "Counties",ylab = "completed_rate")
#sort the completed rate as decreasing order.
Vaccine<-Vaccine[order(Vaccine$completed_rate, decreasing= T),]
#summary statistics
summary(Vaccine)
barplot(Vaccine$completed_rate, names.arg =Vaccine$County , beside = FALSE,
        horiz = FALSE, density = NULL, angle = 45,  col = NULL,
        border = par("fg"), xlab ="COUNTY", ylab = "Completed rate")
