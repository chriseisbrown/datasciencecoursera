##testCacheMatrix.R

# make a square matrix
m <- matrix(rnorm(9), nrow = 3, ncol = 3)
m

# put it in the cachematrix holder
cachedMatrix <- makeCacheMatrix(m)
print(cachedMatrix$get())

# invert the cached matrix
t <- cacheSolve(cachedMatrix)
t

# check by inverting this matrix again
tcachedMatrix <- makeCacheMatrix(t)
tt <- cacheSolve(tcachedMatrix)
tt