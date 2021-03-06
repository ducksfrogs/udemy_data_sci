dataset <- read.csv('../data/Position_Salaries.csv')
head(dataset)
dataset <- dataset[2:3]

lin_reg <- lm(Salary ~ Level, data = dataset)
summary(lin_reg)

dataset$Level2 <- dataset$Level^2
dataset$Level3 <- dataset$Level^3

dataset
poly_reg <- lm(formula = Salary ~ ., data = dataset
               )
summary(poly_reg)

library(ggplot2)

ggplot() + 
  geom_point(aes(x = dataset$Level, y= dataset$Salary), color='red') +
  geom_line(aes(x=dataset$Level, y=predict(lin_reg,
                                           newdata = dataset)), color='blue')+
  ggtitle("Truth or Bluff Linear Regression") +
  xlab('Level') + 
  ylab('Salary')

ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary),
             color='red') +
  geom_line(aes(x=dataset$Level, y= predict(poly_reg, newdata = dataset)),
            color='blue') +
  ggtitle("Truth or Bluff(Poly") +
  xlab('Level') +
  ylab('Salary')

y_pred = predict(lin_reg, data.frame(Level=6.5))
y_pred
y_pred <- predict(poly_reg, data.frame(Level=6.5,
                                       Level2 = 6.5^2,
                                       Level3 = 6.5^3))
y_pred
