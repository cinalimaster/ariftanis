
num1 = float(input("Enter a number here")) #it will convert input into a floating number
op = input("Enter +/*-") #it is a string
num2 = float(input("Enter a number here")) #it will convert input into a floating number

if op == "+":
    print(num1 + num2)
elif op == "-":
    print(num1 - num2)
elif op == "*":
    print(num1 * num2)
elif op == "/":
    print(num1 / num2)
else:
    print("Error:you must enter +-*/")
