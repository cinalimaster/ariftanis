#Tuple is a data container similar to list like coordinates

coordinates = (4, 5) # tuple's immutable <you cant change or edit them>
print(coordinates[0]) # prints 4 first element inside tuple

#if you try this you will get an error
coordinates = (4, 5) # tuple's immutable <you cant change or edit them>
coordinates[0] =10 # we tried to change 4 value into 10 by this line of code
print(coordinates[0]) # prints error message

#difference between lists and tuples
coordinates = [(4, 5), (8, 4), (1, 2)] #these coordinates are list of tuples
