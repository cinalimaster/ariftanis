#we create a basic list
number_grid = [
    1, 2, 3, 4
]
#now we want to create a list which its elements are also lists
number_grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [0]
]
#this is a 4 rows 3 columns grid list

# now how we access individual elements of this list of list

number_grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [0]
]
print(number_grid[0][2])# first row 3th column

#nested for loop for loop inside a for loop
number_grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [0]
]

for row in number_grid:
    print(row)#this will print every row in the list
#we now create a for loop inside a for loop

number_grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [0]
]

for row in number_grid:
    for col in row: #we start another for loop for each column of the parent for loop
        print(col) # this will print each member of the grid seperately

"""we are at 2 hours 52 min mark build a translator part"""