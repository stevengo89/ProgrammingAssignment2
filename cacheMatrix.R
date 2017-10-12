## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## Function to get, set, getinverse, setinverse for "matrix"
function(x = matrix()) {
    ## prepare makeCacheMatrix
    inv <- NULL
    ## Take Argument
    set <- function(y) {
        x <<- y
        inv <<- NULL
    } ## return Argument
    get <- function() x
    ## get function
    setinverse <- function(inverse) m <<- inverse
    ## set function
    getinverse <- function() m
    ## return function
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

function(x, ...) {
    inv <- x$getinverse()
    ## if not NULL no calculating, return message
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    ## if yes, solve it and return it
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
}
