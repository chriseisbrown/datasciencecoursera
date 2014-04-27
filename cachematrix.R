## These functions demonstrate how to create a cache object, in this case one that
## holds matrices and their corresponding inverse.
## makeCacheMatrix - sets up the caching matrix object
## cacheSolve      - demonstrates how to use the cached matrix, returning a previously 
##                   computed inverse if it exists. 

## This function creates a cached matrix object. This is a holder for the original, 
## passed in matrix and for that matrix inverted. Matrix inversion is done 
## externally to this object.
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


## This function takes a cacheMatrix object and inverts it. If a previous inversion has
## been carried out then it returns the cached result to avoid costly recomputation.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'

    ## check if we've already cached an inverted matrix    
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
