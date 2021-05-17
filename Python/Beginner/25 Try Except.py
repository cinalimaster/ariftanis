#this is for catching errors

number = int(input("Enter a number"))
print(number)

#when we enter a text here then program gives
"""
Traceback (most recent call last):
  File "C:\Users\cinali\PycharmProjects\Giraffe\25 Try Except.py", line 3, in <module>
    number = int(input("Enter a number"))
ValueError: invalid literal for int() with base 10: 'ali'

"""

#burada bize 3. satırda
# number = int(input("Enter a number")) yazan yerin içinde
# int() fonksiyonunun içerisine girilen değerin geçersiz olduğunu söylüyor

try:
    number = int(input("Enter a number: "))
    print(number)
except:
    print("Invalid Input")

"""burada yaptığımız şey kullanıcı integer dışında bir şey yazarsa hata 
verip programı kırmak yerine invalid input uyarısı veriyor programı kırmıyor """


try:
    value = 10/0
    number = int(input("Enter a number: "))
    print(number)
except ZeroDivisionError:
    print("Devided by zero") #sıfırla bölünme olursa yakalar
except ValueError:
    print("invalid input") #rakam yerine sayı girilirse yakalar

#another version

try:
    value = 10/0
    number = int(input("Enter a number: "))
    print(number)
except ZeroDivisionError as err:   # <<--------- BEST PRACTICE
    print(err) #sıfırla bölünme olursa yakalar ve hatanın türünü söyler
except ValueError:
    print("invalid input") #rakam yerine sayı girilirse yakalar
