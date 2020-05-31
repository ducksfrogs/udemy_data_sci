#Reggrassion Template
dataset <- read.csv("../data/50_Startups.csv")
dataset <- dataset[2:3]

lin_reg <- lm(formula = Salary ~ ., data = dataset)


library(ggplot2)
X_grid <- seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + geom_point(aes(x= training_set$YearsExperience,
                          y= training_set$Salary),
                      color='red') +
          geom_line(aes(x=X_grid,
                        y=predict(regressor, newdata = data.frame(Level = X_grid)) )
                    ,color='blue') +
          ggtitle("Salary vs Expericne")+
          xlab("Years Experience") +
          ylab("Salary")
