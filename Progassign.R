
makeCacheMatrix <- function(x = matrix()) { # initialize the matrix to NULL
  inverse  <- NULL
  set <- function(y) 
  {
    x <<- y
    inverse <<- NULL
  }
  get <- function() 
  {
    x
  }

  setinverse <- function(inv)
  { 
    inverse <<- inv
  }
  getinverse <- function()
  {
    inverse
  } 
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


##  This function computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
          inverse <- x$getinverse()

  if(!is.null(inverse)) 
  {
    message("getting cached data")
    return(inverse)
  }

  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
}
