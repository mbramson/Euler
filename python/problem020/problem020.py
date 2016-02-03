# -*- coding: utf-8 -*-
"""
Created on Tue Feb 24 20:49:21 2015

@author: Bramson

This is very simple in Python. Certainly a more interesting problem in other
languages
"""

## This function returns the sum of the digits (base 10) of n factorial
def FactorialDigitSum(n):
    import math
    fac = math.factorial(n)
    digitList = list(str(fac))
    sumdigits = 0
    for i in digitList:
        sumdigits += int(i)
    return sumdigits
    
print FactorialDigitSum(100)