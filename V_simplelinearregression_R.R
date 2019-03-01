
dataset = read.csv('Salary_Data.csv')

#Spliting the dataset into the training set and test set
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


#Fitting Simple Linear Regression to the training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)
summary(regressor)

#Predict the test set result
y_pred = predict(regressor, newdata = test_set)

install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience(Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')
