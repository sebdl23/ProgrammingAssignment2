## Put comments here that give an overall description of what your
## functions do: 
##I have the same frame as the example function, the I just cahnged the names to make it understandable
## i changed the names of mean for invert. Also I change the function mean for solve to invert the matrix 

## Write a short comment describing this function: creates matrix that can cache invert value

makeCacheMatrix <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinvert <- function(invert) m <<- invert
  getinvert <- function() m
  list(set = set, get = get,
       setinvert = setinvert,
       getinvert = getinvert)
}


## Write a short comment describing this function: calculates invert value and then stores it in uper function

cacheSolve <- function(x, ...) {
  m <- x$getinvert()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinvert(m)
  m
}

