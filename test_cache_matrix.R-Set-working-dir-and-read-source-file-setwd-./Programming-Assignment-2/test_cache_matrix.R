
## Set working dir and read source file:
setwd("./Programming Assignment 2/PeerEval")
source("cachematrix.R")

## Make a test matrix:
m <- matrix(1, nrow = 3, ncol = 3)
m[1,1] = 10
m[2,2] = 10
m[3,3] = 10

## Make cached matrix:
cm <- makeCacheMatrix(m)
cm$get()

## First run - calculation:
cacheSolve(cm)

## Second run - reading from the cache:
cacheSolve(cm)

## Expected output: ##
# > cm$get()
# [,1] [,2] [,3]
# [1,]   10    1    1
# [2,]    1   10    1
# [3,]    1    1   10
# > 
# > ## First run - calculation:
# > cacheSolve(cm)
#              [,1]         [,2]         [,3]
# [1,]  0.101851852 -0.009259259 -0.009259259
# [2,] -0.009259259  0.101851852 -0.009259259
# [3,] -0.009259259 -0.009259259  0.101851852
# > 
## Second run - reading from the cache:
# > cacheSolve(cm)
# getting cached data
#              [,1]         [,2]         [,3]
# [1,]  0.101851852 -0.009259259 -0.009259259
# [2,] -0.009259259  0.101851852 -0.009259259
# [3,] -0.009259259 -0.009259259  0.101851852
