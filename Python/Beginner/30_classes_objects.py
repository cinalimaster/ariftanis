"""I can create different data types other than strings integer floating number or boolean data
this is called creating new types of classes in this case we will create new
type of class called "student" first create a file called student.py
"""
from student import Student # first one is file name second one is class name

student1 = Student("Jim", "Business", 3.1, False) # this is a student object includes name major gpa probation status
student2 = Student("Mike", "Biology", 2.8, True)

print(student1.name) # this gives students name

print(student1.gpa) # this gives students gpa