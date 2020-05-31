dataset <- read.csv("../data/Salary_Data.csv")

install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split==TRUE)
test_set <- subset(dataset, split==FALSE)

regressor <- lm(Salary ~ YearsExperience, data = training_set)

summary(regressor)

y_pred <- predict(regressor, newdata = test_set)
y_pred

#Display graph

library(ggplot2)
ggplot() + geom_point(aes(x= training_set$YearsExperience,
                          y= training_set$Salary),
                      color='red') + 
          geom_line(aes(x=training_set$YearsExperience,
                        y=predict(regressor, newdata = training_set) )
                    ,color='blue') +
          ggtitle("Salary vs Expericne")+
          xlab("Years Experience") +
          ylab("Salary")
  
#testset
ggplot() + geom_point(aes(x= test_set$YearsExperience,
                          y= test_set$Salary),
                      color='red') + 
          geom_line(aes(x=training_set$YearsExperience,
                        y=predict(regressor, newdata = training_set) )
                    ,color='blue') +
          ggtitle("Salary vs Expericne (test set)")+
          xlab("Years Experience") +
          ylab("Salary")
  