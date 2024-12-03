## Put comments here that give an overall description of what your functions do

## makeCacheMatrix creates a special "matrix", which is really a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## Calculating the inverse of the special "matrix" created with the above function. 
## Firstly checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache "makeCacheMatrix" and skips the computation. 
## Otherwise, it calculates the inverse of the matrix (by SOLVE) and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}


## Example:
x = rbind(c(1, 2), c(2, 1)) ## Create firstly a random matrix
dat = makeCacheMatrix(x) 
dat$get()
cacheSolve(m)
