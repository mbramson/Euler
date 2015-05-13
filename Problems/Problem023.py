# -*- coding: utf-8 -*-
"""
Created on Mon Mar 09 23:06:01 2015

@author: Bramson

A perfect number is a number for which the sum of its proper divisors is 
exactly equal to the number. For example, the sum of the proper divisors of 28 
would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest 
number that can be written as the sum of two abundant numbers is 24. By
mathematical analysis, it can be shown that all integers greater than 28123 can
be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest 
number that cannot be expressed as the sum of two abundant numbers is less than
this limit.

Find the sum of all the positive integers which cannot be written as the sum of
two abundant numbers.
"""

"""
First things first, let's come up with the fastest way to determine if a number
is abundant first

Obviously, if we start counting up n's divisors, and get past n, we can
stop counting (and finding) divisors because we don't need to know them.
So let's take the ProperDivisors algo we made in Problem 21 and modify it a bit
"""
def isAbundant(n):
    if n < 1:
        raise Exception("isAbundant(n): n must be greater than 0")
    if n==1: return False
    SumDivisors = 0
    for i in xrange(1,int(n/2+1)):
        if n%i==0: SumDivisors += i
        if SumDivisors > n: return True
    return False

"""
We can also tweak it easily to tell you whether n is deficient (-1), abundant 
(1), or perfect (0). This function is O(n).
"""
def Abundance(n):
    if n < 1:
        raise Exception("isAbundant(n): n must be greater than 0")
    if n==1: return 0
    SumDivisors = 0
    for i in xrange(1,int(n/2+1)):
        if n%i==0: SumDivisors += i
        if SumDivisors > n: return 1
    if SumDivisors==n: return 0
    return -1

"""
Luckily, we have a hard upper limit on numbers that can't be written as the sum
of two abundant numbers: 28123. So the obvious next step is to simply output an
array of numbers up to 28123 with their Abundance values. We'll figure out what
to do with this later.
"""
# Produces an array where the value is -1, 0, or 1 depending on the abundance
# of the index. It will produce these numbers up to and including n.
def getAbundanceArray(n):
    AbundanceArray = [0]
    for i in xrange(1,n+1):
        AbundanceArray.append(Abundance(i))
    return AbundanceArray 
"""
Looking at the produced array, it is clear that abundant sums are not common.
It is probably more useful to simply produce an array of numbers that are
abundant. If this isn't actually used, it at least might help us notice a
pattern.
"""
# Produces an array of all abundant numbers up to and including n
def getAbundantNumbers(n):
    AbundantNumberArray = []
    for i in xrange(1,n+1):
        if isAbundant(i): AbundantNumberArray.append(i)
    return AbundantNumberArray
"""
Now that we have a list of abundant numbers, we can pretty easily determine
whether a specific number can or cannot be expressed as a sum of two abundant
numbers by brute forcing in O(nlogn) time, simply by traversing everything in
the predetermined array getAbundantNumbers that is below the number we're
examining. If we have to do this for every number below 28123, we may very well
run into some time complexity issues. Hopefully we can bruteforce our way
through, but if the number were say 28123000, we'd probably have to be more
clever.

We'll have to pass in the getAbundantNumbers(n) array, so that in the encasing
call we can cache it and only have to run it once. If we only intended to call
CanBeExpressedAsSumOfTwoAbundantNumbers once, we obviously wouldn't have to do
this.
"""
# Returns True if n can be expressed as the sum of two abundant numbers in
# AbundantNumberArray. It is expected that AbundantNumberArray will be
# precomputed outside of this function.
def CanBeExpressedAsSumOfTwoAbundantNumbers(n,AbundantNumberArray):
    #1) Find the number of entries in AbundantNumberArray that are below n.
    #      AbundantNumberArray is sorted, so this should be super quick.    
    AbundantNumsBelowN = []
    for i in xrange(0,n):
        if n <= AbundantNumberArray[i]:
            AbundantNumsBelowN = AbundantNumberArray[0:i]
            break
    #2) nested for loop where 2nd index is bound by first index O(nlogn)
    for indexi,i in enumerate(AbundantNumsBelowN):
        for indexj,j in enumerate(AbundantNumsBelowN[indexi:]):
            ASum = AbundantNumsBelowN[indexi] + AbundantNumsBelowN[indexj]
            if ASum == n: return True #2b) If a sum is found, Return True 
            if n > ASum: break #Need to increment indexi.
    return False #3) Otherwise, return false

"""
There are probably a few optimizations we can make to the previous function,
but no immediately obvious ones that would reduce time complexity.

Now for brute force. We simply iterate through all even numbers below 28123 and 
keep a running sum of all numbers for which the previous function returns false
"""
def BruteForceSumOfAllNonAbundantSumNumbersBelow(n):
    runningsum = 0    
    AbundantNumberArray = getAbundantNumbers(n)
    for i in xrange(0,n):
        if CanBeExpressedAsSumOfTwoAbundantNumbers(i,AbundantNumberArray) == False:
            runningsum += i
    return runningsum

"""
This is definitely not the way to go about this. This is extremely slow because
we're repeating a lot of computation.

Instead of iterating through every number and verifying that it is NOT a sum of
two abundant numbers, we could simply iterate through every number and
determine the numbers that are. This means we only have to worry about the 2nd
nested for loops of CanBeExpressedAsSumOfTwoAbundantNumbers. We can then
subtract the sum of all numbers that are the sums of two abundant numbers from
the sum of all numbers 0 through 28123.
"""

#print(CanBeExpressedAsSumOfTwoAbundantNumbers(5000,getAbundantNumbers(5000)))
print(BruteForceSumOfAllNonAbundantSumNumbersBelow(28123))

