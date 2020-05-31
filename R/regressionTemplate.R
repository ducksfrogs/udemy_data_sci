#Reggrassion Template
dataset <- read.csv("../data/50_Startups.csv")
dataset <- dataset[2:3]

lin_reg <- lm(formula = Salary ~ ., data = dataset)


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