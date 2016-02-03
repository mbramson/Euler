## Problem 004
##
## A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is
##
## 9009 = 91 x 99
##
## Find the largest palindrome made from the product of two 3-digit numbers.

## The first thought would be to simply count up and test every single combination of x and y, storing the greatest that you find along the way.
## While this avoids the step of comparing which next value is greatest, you will be coming at the problem from the wrong direction.
## While it is is certainly possible that the palindrome may be a small number and therefore be quicker found through this method, this is unlikely
## (Also at this point we're assuming that we know nothing about any mathematical properties of products that are palindromes.

## Implementation 1
## The plan with this algorithm is simple:
## 1) Start with the greatest two numbers. (This will be 99 and 99, 9999 and 9999, etc.)
## 2) Test if the product is a palindrome. If it is, return this value,
## 3) Decrement either the first or second number depending on which number's product is greatest. Test it for being a palindrome. 
##    If it is, return this value. If it isn't, repeat Step 3.

## Implementation 2
## It has been determined that Implementation 1 does not work.
## To figure out why it didn't work I loaded the data up into excel.
## The issue is that implementation 1 doesn't actually go through the data from largest product to smallest.
## This method does loop from greatest product to smallest.
## There is undoubtedly an analytical solution for this, but I wanted to attack the problem with an algorithm that looped through the products in descending order.
## One key property of this is that we can ignore half of products since they are duplicates. Therefore we will never ever test the same product twice.

## Essentially:
## 1) Set a and b to each be equal to the largest number that can be made from the parameter 'digits' of digits (999, 9999, etc.)
## 2) Check to see if the current product is a palindrome. If it is, return it.
## 3) If a is equal to the starting value (999, 9999, etc.), Translate according to the method derived in excel. 
## 4) If a is not equal to the starting value, increase a by 1, and decrease b by 1. If you charted these products out with columns and rows corresponding to a and b, this would be moving on a diagonal.
## 5) Go to step 2

## This function determines if its parameter, n, is a palindrome.
def IsPalindrome(n):
    s = str(n)  ## Convert n to a string
    if s == s[::-1]: ## Check to see if the reverse of the string is equal to the string.
        return True 
    return False

## This method returns the largest palindrome that is the product of two numbers that have "digits" number of digits. 

def LargestPalindrome(digits):
    startnum = 10**digits - 1 ## This will generate 99, 999, 9999, etc.
    a,b = startnum,startnum
    while IsPalindrome(a*b) == False: ##If a * b is not a palindrome, decrement one of them.
        if a == startnum: ##Have we finished translating down the diagonal?
            deltaa = -((startnum + b + 1) / 2 - b)
            deltab = (startnum + b - 1) / 2 - b
            a += deltaa
            b += deltab
            continue
        a = a + 1 ## If a != startnum, proceed along the diagonal
        b = b - 1
    return a * b

print(LargestPalindrome(3))
