"""
I wake up
if I'm hungry
    I eat breakfast

I leave my house
if it's cloudy
    I bring an umbrella
otherwise
    I bring sunglasses

Im at a restraurant
if I want meat
    I order a steak
otherwise if I want pasta
    I order spaghetti & meatballs
otherwise
    I order salad.

"""

is_male = False #or False
is_tall = True #or False

if is_male or is_tall:  #you can use and instead of or
    print("You are eighter male or tall or both")
else:
    print("You are neither male nor tall")


#enother example with elis (else if)

is_male = True #or False
is_tall = False #or False

if is_male and is_tall:  #you can use and instead of or
    print("You are a tall male")
elif is_male and not(is_tall):  # you can use and instead of or
        print("You are a short male")
elif not(is_male) and is_tall:  # you can use and instead of or
        print("You are a tall female")
else:
    print("You are not a male and not tall")