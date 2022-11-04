#Loading the data
data <- read.csv("https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv")
#head of the data
head(data)
#summary of the data
summary(data)
#structure of the data
str(data)
#checking for null values
any(is.na(data))
#plotting the data
x <- data$Hours
y <- data$Scores
plot(x ~ y)
abline(lm(x ~ y))
#building the model
model <- lm(y ~ x)
summary(model)
plot(model)
#predicting using the model
Score.prediction <- predict(model,data)
print(Score.prediction)
#prediction of score if student studies of 9.25 hrs/day
object <- data.frame(x=9.25)
result <- predict(model,object)
print(result)