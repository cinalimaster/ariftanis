#user tries to find out secret world inside the program
"""
secret_word = "giraffe"
guess = ""


while guess != secret_word: # it will keep continue if guess is not match secret_word
    guess = input("Enter guess: ")

print("You have succesfully guessed secret word")

"""

secret_word = "giraffe"
guess = ""
guess_count = 0 #it counts how many guesses made starts from 0
guess_limit = 3 #this will give you user number of trials
out_of_guesses = False # this means user still can continue guess loop continues

while guess != secret_word and not(out_of_guesses): # it will keep continue if guess is not match secret_word and not out of guesses condition met
    if guess_count < guess_limit: #if this condition met user still has guess count
        guess = input("Enter guess: ")
        guess_count += 1 #this increase guess count +1 each time you gues
    else:
        out_of_guesses = True

if out_of_guesses:
    print("Out of guesses, You Lose!")
else:
    print("You have succesfully guessed secret word")












