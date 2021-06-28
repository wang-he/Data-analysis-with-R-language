library(readxl)
#read death_case
death_cases<-read_xlsx("C:/Users/USER/Downloads/COVID-19 in Alabama.xlsx")
#scan the data information
str(death_cases)
#count the missing value
table(is.na(death_cases))
#omit the missing value
Death_case<-na.omit(death_cases)
#Conversion data type (character type becomes numeric type)
Death_case$Cases<-as.numeric(Death_case$Cases)
Death_case$`Total Tested By County`<-as.numeric(Death_case$`Total Tested By County`)
Death_case$Deaths<-as.numeric(Death_case$Deaths)
str(Death_case)
#calculate Death rate
Death_case$Death_rate<-Death_case$Deaths/Death_case$Cases
#draw the line for death rate
plot(Death_case$Death_rate,type="o",xlab = "Counties",ylab = "Death_rate")
#sort the counties by the death rate in descending order.
Death_case<-Death_case[order(Death_case$Death_rate, decreasing= T),]
#summary statistics
summary(Death_case)



