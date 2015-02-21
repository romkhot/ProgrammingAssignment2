## The following functions could be used to cache the inverse of a matrix with some benefits in performance.

##1. The makeCacheMatrix function returns a list of functions to perform:  ##
#    set/get the value of matrix
#    set/get the value of inverse of matrix
makeCacheMatrix <- function(x = matrix()) {
   inv <- NULL
   set_ <- function(y) {
      x <<- y
      inv <<- NULL
   }
   get_ <- function() x
   set_inverse <- function(inverse) inv <<- inverse
   get_inverse <- function() inv
   list(set=set_, get=get_, setInverse=set_inverse, getInverse=get_inverse)
}

##2. The cacheSolve function returns the inverted matrix.  ##
#    If the inverse has already been computed, it returns the cached result without re-computation. 
#    Otherwise it computes the inverse, then sets the value in the cache using the setInverse function.
#    Assuming that a matrix is always invertible.
cacheSolve <- function(x, ...) {
   inv_matr <- x$getInverse()
   if(!is.null(inv_matr)) {
      message("Cached data!")
   } else {     
     inv_matr <- solve(x$get())
     x$setInverse(inv_matr)
   }
   inv_matr
}

##3. Example of usage: ##
m <- matrix(1, nrow = 3, ncol = 3)
m[1,1] = 10
m[2,2] = 10
m[3,3] = 10
cm <- makeCacheMatrix(m)
cm$get()
#      [,1] [,2] [,3]
# [1,]   10    1    1
# [2,]    1   10    1
# [3,]    1    1   10

## First run - calculation:
cacheSolve(cm)
#              [,1]         [,2]         [,3]
# [1,]  0.101851852 -0.009259259 -0.009259259
# [2,] -0.009259259  0.101851852 -0.009259259
# [3,] -0.009259259 -0.009259259  0.101851852

## Second run - reading from the cache:
cacheSolve(cm)
# Cached data!
#              [,1]         [,2]         [,3]
# [1,]  0.101851852 -0.009259259 -0.009259259
# [2,] -0.009259259  0.101851852 -0.009259259
# [3,] -0.009259259 -0.009259259  0.101851852
