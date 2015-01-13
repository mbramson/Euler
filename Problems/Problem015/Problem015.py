# -*- coding: utf-8 -*-
"""
Created on Tue Jan 13 14:19:11 2015

@author: Bramson
"""

def GridMoves(x,y):
    if x==1:
        return y + 1
    if y==1:
        return x + 1
    return GridMoves(x-1,y) + GridMoves(x,y-1)
    
print(GridMoves(20,20))