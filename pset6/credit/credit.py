from cs50 import get_int

# Card number input
number = get_int("Number:")

count = verify = result = second = first = 0

while number > 0:
    # Os sum pairs
    if count % 2 == 0:
        result = int(result + (number % 10))
    else:
        # Odd multiplies
        verify = (number % 10) * 2

        # If multiplication is more than 10 adds to each other
        if verify % 10 != 0 or verify % 10 == 0:
            verify = (verify % 10) + (verify / 10)

        # Sums the multiplications
        result = int(result + verify)

    # Saving the first numbers for flag verification
    second = first
    first = number
    count += 1
    number = int(number / 10)

if result % 10 == 0 and (first == 4 or first == 3 or first == 5):
    # All American Express numbers start with 34 or 37
    if (second == 34 or second == 37) and count == 15:
        print("AMEX")
    # MasterCard numbers start with 51, 52, 53, 54, or 55
    elif (second == 51 or second == 52 or second == 53 or second == 54 or second == 55) and count == 16:
        print("MASTERCARD")
    # Visa numbers start with 4
    elif first == 4 and (count == 13 or count == 16):
        print("VISA")
    else:
        print("INVALID")
else:
    print("INVALID")