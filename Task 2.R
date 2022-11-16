#loading the libraries
library(ggplot2)
library(cluster)
#loading the data
data <- read.csv("Iris.csv",header = T,sep = ",")
#plotting the data to have an idea
data.plot <- ggplot(data,aes(PetalLengthCm,PetalWidthCm))
data.plot + geom_point(aes(color=Species),size=4)
#building the clustering model
set.seed(128)
datacluster <- kmeans(data[,2:4],3,nstart = 20)
print(datacluster)
table(datacluster$cluster,data$Species)
#plotting the clusters
clusplot(data,datacluster$cluster,color=T,shade=T,labels=0)
