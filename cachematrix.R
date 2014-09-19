
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- x
  setinv <- solve(x)
  m<-setinv
  getinv<<- setinv
  x<<-list(set = set, get = get,
           setinv = setinv,
           getinv = getinv)
}


## It works on the similar principle as the vector function works

cacheSolve <- function(x, ...) {
  if(class(x)=="list"){ 
    m <- x$getinv
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
  }
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  ##This part of code is repeated to take into account that x is amatrix and not a list
  get <- x
  setinv <- solve(x)
  m<-setinv
  getinv<<- setinv
  x<<-list(set = set, get = get,
           setinv = setinv,
           getinv = getinv)
}
