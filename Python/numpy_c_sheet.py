import numpy as np

# creating arrays
a = np.array([1,2,3])
b = np.array([(1.5,2,3), (4, 5, 6)], dtype=float)
c = np.array([ [(1.5,2,3), (4, 5, 6)], [(1.5,2,3), (4, 5, 6)]], dtype=float)

# initial placeholders
np.zeros( (3,4) ) # create a 3 x 4 array of zeros
np.ones( (2,3,4), dtype=np.int16) # create a 2x 3 x 4 array of ones
d = np.arrange(10,25,5) # creates a 10 x 25 array of evenly spaced values (step value here is 5)
np.linspace(0,2,9) # creates a 10 x 25 array of evenly spaced values (number of samples)
e = np.full( (2,2), 7) # creates a constant 2 x 2 array of 7s
f = np.eye(2) # creates 2x2 identity matrix
np.random.random( (2,2) ) # creates 2x2 array with random numbers
np.empty( (3,2) ) # creates 3x2 empty array

# input and output I/O
# saving and loading on disk
np.save('my_array', a)
np.savez('array.npz, a, b)
np.load('my_array.npy')

# saving loading text files
np.loadtxt('myfile.txt')
np.genfromtxt('my_file.csv', delimiter=',')
np.savetxt('myarray.txt', a, delimiter=' ')

# data types
np.int64
np.float32
np.complex
np.bool
np.object
np.string_ # fixed lenght string type
np.unicode 

# inspecting array
a.shape # array dimensions
len(a) # lenght of array
b.ndim # number of dimensions
e.size # number of array elements
b.dtype # data type of array elements
b.dtype.name # name of data type
b.astype(int) # convert array to a different type

# asking for help
np.info(np.ndarray.dtype)

# array math calculations
g = a - b
         array([[-0.5, 0., 0.],
                [-3., -3., -3.]])

np.subtract(a,b)
###
b + a
         array([[2.5, 4., 6.],
                [5., 7., 9.]])
np.add(b,a)
###
a/b
         array([[0.66, 1., 1.],
                [0.25, 0.4,0.5]])

np.divide(a,b)
###
a*b
         array([[1.5, 4., 9.],
                [4., 10., 18.]])
np.multiply(a,b)
###

np.exp(b) # exponentiation
np.sqrt(b) # squareroot
np.sin(a) # print sines of an array
np.cos(b) # element-wise cosine
np.log(a) # element-wise natural logarithm
e.dot(f) # dot product
         array([[7., 7.],
                [7., 7.]])
         
# comparison
a == b # element-wise comparison
  array([[False, True, True,],
         [False, False, False]], dtype=bool)

a < 2 # constant-wise comparison
         array([True, False, False], dtype=bool

np.array_equal(a,b) # array-wise comparions

# aggregate functions
a.sum() # array-wise sum
a.min() # array-wise min value
b.max(axis=0) # max value of an array's first row 
b.cumcum(axis=1) # cumulative sum of the elements
a.mean() # mean
b.median() # median
a.corrcoef() # correlation coefficient
np.std(b) # standart deviations

# copying arrays
h = a.view() # create view of and array with the same data
np.copy(a) # create a copy of the array
h = a.copy() # create a deep copy of the array

# sorting arrays
a.sort() # sort an array
c.sort(axis=0) # sort the elenments of array's first axis

# subsetting, slicing, indexing 

# subsetting
# [1, 2, 3]
a[2]     # selects the element of index num 2. which is 3 

# [1.5, 2, 3]
# [6  , 7, 4] 
b[1,2]  # selects index 1 (second row) index 2 (third column) which is 4

# slicing
# [1, 2, 3]
a[0:2]     # selects row items at index 0 to 1 "notice 2 not included" which is [1,2] 
               
# [1.5, 2, 3]
# [6  , 7, 4] 
b[0:2,1]   # selects row items at index 0 to 1 "notice 2 not included" which is 2 and 7

# [1.5, 2, 3]
# [6  , 7, 4]
b[:1] # returns all variables from first row which is array([[1.5, 2, 3]]) equivalent to b[0:1, :]

c[1,...] # returns all variables from second row which is array([[6, 7, 4]])) equivalent to [1,:,:]
               
# reversed array
a[: : -1] # returns array([3, 2, 1])

# boolean indexing
a[a<2] # selects element from a which are less than 2

# fancy indexing
b[[1, 0, 1, 0],[0, 1, 2, 0] # selects 4 elements like-wise row and column index number

b[[1, 0, 1, 0]][:,[0,1,2,0]] # selects a subset of matrix's rows and columns

# array manipulation

# transpose
i = np.transpose (b) 
i.T

# changeing array shape
b.ravel() # flattens the array
g.reshape(3,-2) # reshapes array but don't changes data

# adding removing elements
h.resize((2, 6)) # retunrs a new array with (2,6) shape
np.append(h, g) # append items to h array from g array
np.insert(a, 1, 5) # insert item into array to certain row column
np.delete(a,[1]) # delete items from an array

# Combining Arrays
np.concatenate((a, d), axis=0) # concatenate arrays

# stacking arrays vertically (row-wise)
np.vstack((a,b))
np.r_[e, f]

# stack arrays (column-wise)
np.hstack((e, f))

# create stacked column-wise arrays
np.column_stack((a, d))
np.c_[a, d]

# splitting arrays horizontally at the 3rd index
np.hsplit(a,3)

# splitting array vertically at the 2nd index
np.vsplit(c,2)


          
         
         
         
         
         
      
