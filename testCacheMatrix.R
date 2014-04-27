##testCacheMatrix.R

# make a square matrix
m <- matrix(1:9, nrow = 3, ncol = 3)
m

# put it in the cachematrix holder
cachedMatrix <- makeCacheMatrix(m)
print(cachedMatrix$get())
