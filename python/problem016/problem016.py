# -*- coding: utf-8 -*-

## Power Sums

## 2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

## What is the sum of the digits of the number 2**1000?

## This is actually a very simple problem in python, because Python automatically deals with large numbers.

## Returns the Power Sum of n. As in it sums the digits of 2^n
def PowerSum(n):
    sumstring = str(2**n)
    total = 0
    for s in sumstring:
        total += int(s)
    return total
    
print(PowerSum(1000))