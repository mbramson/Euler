# -*- coding: utf-8 -*-
"""
Created on Thu May 28 21:33:30 2015

@author: Bramson

A permutation is an ordered arrangement of objects. For example, 3124 is one 
possible permutation of the digits 1, 2, 3 and 4. If all of the permutations 
are listed numerically or alphabetically, we call it lexicographic order. The 
lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 
0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
"""

#returns the nth lexicographic permutation of 'digits' digits
def nthPermutation(digits, n):
    if digits > 36: raise exception('more than 36 digits aren ot supported'):
    perm = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"[:digits]
    
    
#Two options for implementation
    #1)determine the next permutation, and make the change. increment a counter
    #and repeat until we hit n.
    #2)find a formulaic method that determines the nth permutation directly
    #3)produce an array of every possible permutation and sort it.