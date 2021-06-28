install.packages("dplyr")
library(dplyr)
library(readxl)
#read covid19 provider
provider<-read_xlsx("C:/Users/USER/Downloads/COVID-19 in Alabama Vaccine Providers.xlsx")
#calculate number of null values.(result false means it has no N/A value out of 1221 data.)
table(is.na(provider))
#group all vaccine provider
provider_group<- group_by(provider, provider$County)
#sort provider$County by ascending order
provider_group<- provider_group[order(provider_group$`provider$County`,decreasing=F),]
View(provider_group)
#count the number of providers in each county
provider_count<- summarise(provider_group,count = n())
#sort it in decreasing order
provider_count<- provider_count[order(provider_count$count,decreasing=T),]
# get a descending order result. names.arg means text label under the bar graph; 
# beside is logical value, false means a stacked column chart;
# horiz is logical value, false means drawing vertical bar graph;
barplot(provider_count$count, names.arg = provider_count$`provider$County`, beside = FALSE,
        horiz = FALSE, density = NULL, angle = 45,  col = NULL,
        border = par("fg"), xlab ="COUNTY", ylab = "Number of Providers")
summary(provider_count$count)
