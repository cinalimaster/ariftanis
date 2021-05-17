lucky_numbers = [4, 8 ,15, 16, 23, 42]
friends = ["Kevin", "Karen", "Jim", "Jim", "Oscar", "Toby", ]

friends.extend(lucky_numbers) # it extends the list by adding another list
print(friends)

lucky_numbers = [4, 8 ,15, 16, 23, 42]
friends = ["Kevin", "Karen", "Jim", "Oscar", "Toby", ]

friends.append("Creed") # it only adds a single variable at the end of your list
print(friends)

friends.insert(1, "Kelly") # adds Kelly to position 1 and other variables pushed to right
print(friends)

friends.remove("Jim") # removes Jim from list remaining elements pushed left to start
print(friends)

friends.pop() #removes last element from the list
print(friends)

print(friends.index("Kevin")) #gives the index number in the list of your input

friends = ["Kevin", "Karen", "Jim", "Jim", "Oscar", "Toby", ]
print(friends.count("Jim")) #gives how many times your input in the list

lucky_numbers.sort() # sorts elements of list from small to big default
print(lucky_numbers)

lucky_numbers.reverse() # reverse the order of the list
print(lucky_numbers)

friends_2 = friends.copy() # friends_2 is a copy of friends

