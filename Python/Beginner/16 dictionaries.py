Jan -> January

monthConversions = {
    "Jan" : "January", # we convert 3 letter month names into full name month names left key right side value
    "Feb" : "February", # keys must be unique
    "Mar" : "March",
    "Apr" : "April",
    "May" : "May",
    "Jun" : "June",
    "Jul" : "July",
    "Aug" : "August",
    "Sep" : "September",
    "Oct" : "October",
    "Nov" : "November",
    "Dec" : "December",
} # we created a dictionary now we can acces them

print(monthConversions["Nov"]) # it has different call variant options
print(monthConversions.get("Dec")) # it will bring default value "None" if you input an invalid key you can also assing a default value
print(monthConversions.get("lul", "Not a valid key")) # it will bring default value "Noot a valid key" if you input an invalid key default value assigned