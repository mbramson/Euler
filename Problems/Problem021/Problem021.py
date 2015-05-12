# -*- coding: utf-8 -*-
"""
Created on Tue Feb 24 22:17:32 2015

@author: Bramson

Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
"""
#The reason for the first 2 methods is so that we have a list to work with
#in case we discover some property of amicable numbers that involves their
#proper divisors that makes them less computationally difficult to calculate.

#Returns a list of proper divisors of n
def ProperDivisors(n):
    if n < 1:
        raise Exception("ProperDivisors(n): n must be greater than 0")
    if n==1: return [1]
    if n==2: return [1,2]
    DivisorList = [1]
    for i in range(2,int(n/2+1)):
        if n%i==0: DivisorList.append(i)
    return DivisorList

# Returns the sum of the proper divisors of n. Builds a list first.
def SumProperDivisorsFromList(n):
    return sum(ProperDivisors(n))

#Returns the sum of the proper divisors of n.
def SumProperDivisors(n):
    if n < 1:
        raise Exception("ProperDivisors(n): n must be greater than 0")
    if n==1: return 1
    if n==2: return 3
    DivisorSum = 1
    for i in range(2,int(n/2+1)):
        if n%i==0: DivisorSum += i
    return DivisorSum

#Returns a list of sums of proper divisors for all numbers below n.
def SumProperDivisorsListBelowN(n):
    SumList = [0] #0th element has 0 sum    
    if n==1: return [0,1]
    for i in range(1,n):
        SumList.append(SumProperDivisors(i))
    return SumList
    
# Returns a dictionary of sums of proper divisors for all numbers below n.
# The The value of a dictionary item is the sum of proper divisors for the key.
def SumProperDivisorsDictBelowN(n):
    SumDict = {0:0}
    if n==1: SumDict[1]=1
    for i in range(1,n):
        SumDict[i]=SumProperDivisors(i)
    return SumDict

#Returns all amicable number pairs where both are below n.
#This should run at O(nlog(n)) which is far from ideal for n=10000
#It will return a dict where each entry consists of an amicable pair between
#the key and the value. If there are no amicable numbers below n, it returns {}
def BruteForceAmicableGen(n):
    DivisorSumDict = SumProperDivisorsDictBelowN(n)
    AmicableDict = {}
    for i in range(1,n):
        for j in range(1,i):
            if DivisorSumDict[i] == j and DivisorSumDict[j] == i:
                AmicableDict[i] = j
    return AmicableDict

# This method simply sums all keys and all values of a dictionary.    
def SumDictKeysAndValues(Dictionary):
    return sum(Dictionary.keys())+sum(Dictionary.values())
    
def AmicableNumberSumBelowN(n):
    return SumDictKeysAndValues(BruteForceAmicableGen(n))    
    
# A method that may be faster is to 
    
    
print AmicableNumberSumBelowN(10000)