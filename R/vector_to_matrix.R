# A matrix is really just a vector with a dim attribute (for the dimensions). So you can add dimensions to vec using the dim() function and vec will then be a matrix:

vec <- 1:49
dim(vec) <- c(7, 7)  ## (rows, cols)
vec

> vec <- 1:49
> dim(vec) <- c(7, 7)  ## (rows, cols)
> vec
     [,1] [,2] [,3] [,4] [,5] [,6] [,7]
[1,]    1    8   15   22   29   36   43
[2,]    2    9   16   23   30   37   44
[3,]    3   10   17   24   31   38   45
[4,]    4   11   18   25   32   39   46
[5,]    5   12   19   26   33   40   47
[6,]    6   13   20   27   34   41   48
[7,]    7   14   21   28   35   42   49
