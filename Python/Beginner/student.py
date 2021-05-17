class Student:

    def __init__(self, name, major, gpa, is_on_probation, on_honor_roll):  #initial stage of defining
        self.name = name
        self.major = major
        self.gpa = gpa
        self.is_on_probation = is_on_probation
        self.on_honor_roll = on_honor_roll

    def on_honor_roll(self): # checks if student is on honor roll or not
        if self.gpa >= 3.5:
            return True
        else:
            return False # now we created a conditional parameter
