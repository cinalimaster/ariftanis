#FUNCTIONS
def say_hello_func():    #python says this person tries to define a function this functions commands will be indented
    print("Hello User")  #in this line we define what function does

say_hello_func()    # here we call the function when we run this code it executes and prints Hello User

print("Top")
say_hello_func()
print("Bottom")   #here in this section first it prints Top then goes to top and finds function we define then it executes function then prints bottom

# use parameters in functions

def say_hello_func(name):    # it will use name parameter here
    print("Hello " +name)

say_hello_func("Neo") # this will perint hello Neo

def say_hello_func(name, age):    # it will use name parameter here
    print("Hello " + name +", you are " + age)

say_hello_func("Neo","30")

#string number boolean array type fo variable works on functions

# 1hour 34 min