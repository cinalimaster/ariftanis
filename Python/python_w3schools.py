# code from pythoncheatsheet.org
print("Hello, World!")

"""
Beatiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.

Special cases aren't special enough to break the rules.
Although practicaly beats purity.
Errors should never pass silently.
Unless explicitly silenced.

In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one -- obvious way to do it
Although that way may not be obvious at the first unlses you're Dutch.

"""

# Math operations

2 ** 3 = 8 # Exponent
22 % 8 = 6 # Modulus/Reminder
22 // 8 = 2 # Integer division
22 / 8 = 2.75 # Float division
3 * 3 = 9 # Multiplication
5 - 2 = 3 # Subtraction
2 + 2 = 4 # Addition

# -2, 3, intergers // -1.25, -1.32423 Floating point numbers // 'hello world!' strings

# String concentration and Replication
>>> 'Alice' 'Bob'
'AliceBob'

# AVOID + operator for string concentration, Prefer string formatting

# String Replication
>>> 'Alice' * 5
'AliceAliceAliceAliceAlice'

# Variables 
"""only one word, only letters numbers and _ underscore, it can't 
begin with number, variables start with _ considered 'unuseful'. """

>>> spam = 'Hello'
>>> spam
'Hello'

# This is a comment

a = 1 # code with a comment

# Function docstring

def foo():
  """
  This is a function docstring
  You can also use:
  ''' Function Docstring '''
  """
>>> print('Hello world!')
Hello world!

>>> a = 1
>>> print('Hello world!', a)
Hello world! 1

>>> print('What is your name?') # ask for their name
>>> myName = input() # define variable myName and assign a value with input
>>> print('It is good to meet you, {}'.format(myName)) # print variable inside location
What is your name?
Al
It is good to meet you, AI

>>> len('hello') # gives lenght of string
5 
  
>>> a = [1, 2, 3]
>>> if a :
>>>     print("the list is not empty!")

# str(), int() and float() functions

>>> str(29) # converts variable into string
'29'

>>> print('I am {} years old.'.format(str(29))) # converts integer to string and put inside sentence
I am 29 years old.

>>> str(-3.14) # converts floating numbers into string
'-3.14'

>>> int(7.7) # converts floating number into integer
7

>>> int(7.7) + 1 # converts floating number into integer and counts as integer
8

# Comparison Operators
'''
== Equal to
!= Not equal to
< Less than
> Greater than
<= Less than or Equal to
>= Greater than or Equal to
'''

>>> 42 == 42 # brings True boolean if true else give False
True

>>> 40 == 42 # brings False boolean
False

>>> 'hello' == 'hello'
True

>>> 'hello' == 'Hello'
False

>>> 42 == 42.0
True

>>> 42 == '42'
False

>>> True == True
True

>>> True != False
True

# is and is not
>>> True is True
True

>>> True is not False
True

# Boolean operators

# and
>>> True and True
True
>>> True and False
False
>>> False and True
False
>>> False and False
False

# or
>>> True or True
True
>>> True or False
True
>>> False or True
True
>>> False or False
False

# not
>>> not True 
False
>>> not False
True

# Mixing Boolean and Comparison Operators
>>> (4 < 5) and (5 < 6)
True

>>> (4 < 5) and (9 < 6)
False

>>> (1 == 2) or (2 == 2)
True

# if Statements
if name == 'Alice':
  print('Hi, Alice.')
  
name = 'Bob'
if name == 'Alice':
  print('Hi, Alice.')
else:
  print('Hello, stranger.')
  
# elif Statements
name = 'Bob'
age = 5
if name == 'Alice':
  print('Hi, Alice.')
elif age < 12:
  print('You are not Alice, kiddo.')
else:
  print('You are neither Alice nor a little kid.')

# while loop statements
spam = 0                  # set a variable value
while spam < 5:           # set loop condition
  print('Hello, world.')  # give command executed if condition is met
  spam = spam + 1         # set iteration
  
# break statements
while True:
  print('Please type your name.')
  name = input()
  if name == 'George':
    break
print('Thank you!, George')    
  


