#Reading from external files

#open filess in the same directory

open("employees.txt", "r") #open file read only mode "w" write mode

# "a" append mode you can add new information but you can't change original
# "r+" read + write

#we want to store information inside the file with a variable

employee_file = open("employees.txt", "r")
# close file function also needed

employee_file.close() #after reading it we close the file


employee_file = open("employees.txt", "r")
print(employee_file.readable()) # this is a boolean function checks employee file readable or not
employee_file.close()

#this will read and print info from file

employee_file = open("employees.txt", "r")
print(employee_file.read()) # this is read file
employee_file.close()

#read individual line

employee_file = open("employees.txt", "r")
print(employee_file.readline()) # this is read first line file
employee_file.close()

#read individual another line
employee_file = open("employees.txt", "r")
print(employee_file.readline()) # this is read first line file
print(employee_file.readline()) # this is read second line file
employee_file.close()

#read all lines and put them into array

employee_file = open("employees.txt", "r")
print(employee_file.readlines()) # this is read all lines and put them in an array
employee_file.close()

#access specific line in array
employee_file = open("employees.txt", "r")
print(employee_file.readlines()[2]) # this will give second line
employee_file.close()

#using lines command with for loop
employee_file = open("employees.txt", "r")
for employee in employee_file.readlines():
    print(employee) # this will give second line
employee_file.close()
