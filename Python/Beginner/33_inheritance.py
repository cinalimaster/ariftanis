from Chef import Chef

myChef = Chef()
myChef.make_chicken() # if you run this program will output "The chef makes a chicken meal"

# first we import Chef now we will try with ChineseChef

from ChineseChef import ChineseChef

myChineseChef = ChineseChef()
myChineseChef.make_chicken()

# if we don't want to copy and paste entire cook list from chef to chinesechef
# we inherited chef into chinese chef

from ChineseChef import ChineseChef

myChineseChef = ChineseChef()
myChineseChef.make_special_dish() # now if we give this command 2 special dish prompt will override
# we need to create override it on ChineseCheff class file