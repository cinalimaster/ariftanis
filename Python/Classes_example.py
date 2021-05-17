class Car():
    def __init__(self, modelname, yearm, price): # we create class and its parameters
        self.modelname = modelname
        self.yearm = yearm
        self.price = price
    def price_inc(self):  #here we define a class function
        self.price = int(self.price*1.10)

honda = Car('City', 2017, 100) #we define class objects
renault = Car('Clio', 2015, 60)

honda.cc = 1500 #we define a new class object which is engine cc

print(honda.price)# this prints price of honda which is 100
honda.price_inc()# we call class function for honda class object
print.(honda.price)# we call new price after function applied which is 110

print(honda.__dict__) # this is a predefined function for classes it will give every parameter and classname of that object result below
 
(‘modelname’:’city’, ‘yearm’:2017, ‘price’:100, ‘cc’:1500)


----------------------- parent class and inheritance for classes -----------------------

class Parent:
    def _init__(self, fname, fage):
        self.name = fname
        self.age = fage
        
    def view(self):
        print(self.name, self.age)
        
class Child(Parent): # this is child class
    def __init__(self, fname, fage):
        Parent.__init__(self, fname, fage)
        self.lastname = "edureka"
        
    def view(self):
        print(self.age, self.lastname, self.name)
        
ob = Child(23, 'python')
ob.view()

-----------------------    ----------------------- 
