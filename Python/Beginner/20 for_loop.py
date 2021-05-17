for letter in "Giraffe Academy": #for every letter inside text we want to do something
    print(letter)


    """______USE WITH LIST_________________"""

friends = ["Jim", "Karen", "Kevin"]
for friend in friends:  # for every friend inside friend list print a friend name
        print(friend) # You can give variable name whatever you want

"""__________SERES OF NUMBERS_____________"""


friends = ["Jim", "Karen", "Kevin"]
for index in range(10):  # for print each number start from 0 to 10 (10 not included) notice index != friends
        print(index) # You can give variable name whatever you want


"""_______________INDEX RANGE___________"""
for index in range(3, 10):  # for print each number start from 3 to 10 (10 not included) notice index != friends
    print(index)  # You can give variable name whatever you want

"""_______________finding and using a lists lenght___________"""
friends = ["Jim", "Karen", "Kevin"]
len(friends)#to find lenght of fiends it give 3
for index in range(len(friends)):
    print(friends[index]) # this will give Jim Karen Kevin it will give friends[0] friends[1] friends[2]

"""__________________________"""

for index in range(5):
    print(index) # this will give us 0 1 2 3 4 continuously

"""_____________variant _____________"""

for index in range(5):
    if index == 0:
        print("first iteration")
    else:
        print("not first") # this will give us first iteration not first not first 4times...
