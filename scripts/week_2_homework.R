set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

prob1noNA <- na.omit(hw2)
prob1noNA
prob1 <- prob1noNA[prob1noNA >=14 & prob1noNA<=38]
prob1

times3 <- prob1*3
times3
plus10 <- times3+10
plus10
plus10[c(TRUE, FALSE)]
