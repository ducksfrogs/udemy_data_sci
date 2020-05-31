dataset <- read.csv('../data/50_Startups.csv')
head(dataset)
dataset$State <- factor(dataset$State,
                        levels = c("New York", "California", "Florida"),
                        labels = c(1,2,3))
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split==TRUE)
test_set <- subset(dataset, split==FALSE)

regressor <- lm(Profit ~ . ,data = training_set)
summary(regressor)
regressor2 <- lm(Profit ~ R.D.Spend, data = training_set)

y_pred <- predict(regressor, newdata = test_set)

regressor <- lm(Profit ~ R.D.Spend + Administration +
                  Marketing.Spend + State, data = dataset)
summary(regressor)

regressor <- lm(Profit ~ R.D.Spend + Administration +
                  Marketing.Spend , data = dataset)
summary(regressor)
