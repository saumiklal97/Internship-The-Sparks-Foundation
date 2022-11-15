#loading the libraries
library(caTools)
library(rpart)
library(rpart.plot)
#loading the data 
data <- read.csv("Iris.csv",TRUE,",")
head(data)
is.na(data)
#splitting the data for training and testing
set.seed(128)
sample <- sample.split(data$Species,SplitRatio = 0.70)
train <- subset(data,sample==T)
test <- subset(data,sample==F)
# building a decision tree model classifier
tree <- rpart(Species~SepalLengthCm+SepalWidthCm+PetalLengthCm+PetalWidthCm,method = 'class',data = train)
printcp(tree)
#plotting the decision tree
rpart.plot(tree)
prp(tree,type = 4,extra = 101)
#prediction based on the model
tree.pred <- predict(tree,test,type = 'class')
print(tree.pred)
#comparing the prediction vs actual test data
tree.pred <- as.data.frame(tree.pred)
table(test$Species,tree.pred$tree.pred)





