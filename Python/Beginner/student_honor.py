class Student:

    def __init__(self, name, major, gpa):  #initial stage of defining
        self.name = name
        self.major = major
        self.gpa = gpa


    def on_honor_roll(self): # checks if student is on honor roll or not
        if self.gpa >= 3.5:
            return True
        else:
            return False # now we created a conditional parameter
