"""basic exponential number"""

print(2**3)

"""creating exponent function"""

def raise_to_power(base_num, power_num): # we define function and its parameter base number and power number.
    result = 1
    for index in range(power_num):
        result = result * base_num
    return result #we completed the function now we need to call it

print(raise_to_power(3, 2))