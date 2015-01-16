# -*- coding: utf-8 -*-
"""
Created on Fri Jan 16 12:15:18 2015

@author: Bramson
"""
#
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out  
# in words, how many letters would be used?
#
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and 
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 
# letters. The use of "and" when writing out numbers is in compliance with 
# British usage.

# Note: This problem says nothing about 1025. I'm assuming that would be 
# "One Thousand Twenty Five".

## We're going to assume that 0 cannot be entered.

def singledigit(n):
    if n>9:
        raise Exception("n is too large for singledigit(n)")
    numlist = ["","one","two","three","four","five","six","seven","eight",
               "nine"]
    return numlist[n]

def doubledigit(n):
    if n>99:
        raise Exception("n is too large for doubledigit(n)")
    if n<10:
        return singledigit(n)
    if n < 20:
        teenlist = ["ten","eleven","twelve","thirteen","fourteen","fifteen",
                    "sixteen","seventeen","eighteen","nineteen"]
        return teenlist[n-10]
    numlist = ["twenty","thirty","forty","fifty","sixty","seventy","eighty",
               "ninety"]
    return numlist[n/10 - 2] + " " + singledigit(n%10)
def tripledigit(n):
    if n>999:
        raise Exception("n is too large for tripledigit(n)")
    if n<100:
        return doubledigit(n)
    if n%100 == 0:
        return singledigit(n/100) + " hundred"
    return singledigit(n/100) + " hundred and " + doubledigit(n%100)
    
def NumToWord(n):
    if n < 1000:
        return tripledigit(n)
    length = len(str(n))
    scalelist = ["thousand","million","billion","trillion","quadrillion","quintillion"]
    ## Must check if the firstword will be three digits. If it is, you run into
    ## issues with length%3 == 0 and not working well with string slices
    if length%3==0:
        ## Calculate the first word, i.e first word of 123,456 would be "one hundred and twenty three"
        firstword = tripledigit(int(str(n)[:3]))
        return firstword + " " + scalelist[length/3 - 2] + " " + NumToWord(int(str(n)[3:]))
    else:
        ## Calculate the first word, i.e first word of 123,456 would be "one hundred and twenty three"
        firstword = tripledigit(int(str(n)[:length%3]))
        return firstword + " " + scalelist[length/3 - 1] + " " + NumToWord(int(str(n)[length%3:]))    
    