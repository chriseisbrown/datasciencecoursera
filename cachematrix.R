## Comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    get <- function() x
    
    setInverted <- function(inverted) inv <<- inverted
    
    getInverted <- function() inv
    
    list(set = set,
         get = get,
         setInverted = setInverted,
         getInverted = getInverted)
}


## Write a short comment describing this function
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    mData <- x$get()
    mInverted <- solve(mData, ...)
    
    mData <- x$getInverted()
    if(!is.null(mData)) {
        message("getting cached data")
        return(mData)
    }
    mData <- x$get()
    mInverted <- solve(mData, ...)
    x$setInverted(mInverted)
    mInverted
}
