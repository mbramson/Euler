# -*- coding: utf-8 -*-
"""
Created on Sun Feb 22 21:43:05 2015

@author: Bramson
"""
'''
By starting at the top of the triangle below and moving to adjacent numbers on 
the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

'''

## This function converts the text file in the format directly above to two-
## dimenstional nested list where each node is a number as a string
def PopulateTree(TreeTextFileName):
    with open(TreeTextFileName, "r") as f:
        lines = f.readlines()
        for i in range(len(lines)):
            lines[i] = lines[i].replace("\n","").split(" ")
    return lines

## This function returns a nested list with identical dimensions as those
## returned by PopulateTree, but with "" as entries. This is so the
## MaximumSumPath function can check if a value is "" and thus not in cache
def PopulateTreeCache(TreeTextFileName):
    with open(TreeTextFileName, "r") as f:
        lines = f.readlines()
        returnArray = []
        for i in range(len(lines)):
            lines[i] = lines[i].replace("\n","").split(" ")
            returnArray.append([])
            for j in range(i+1):
                returnArray[i].append("")
    return returnArray

## This function determines the maximum sum path through the binary tree input
## By a text file i nthe format above. It iterates through the tree backwards
## thus eliminating any need to calculate number that have previously been
## calculated
def MaximumSumPath(TreeTextFileName):
    Tree = PopulateTree(TreeTextFileName)
    TreeCache = PopulateTreeCache(TreeTextFileName)
    ## Populate the last row of TreeCache
    TreeCache[len(Tree)-1] = Tree[len(Tree)-1]
    for i in range(len(Tree)-2,-1,-1):
        for j in range(len(Tree[i])):
            TreeCache[i][j] = max(int(Tree[i][j]) + int(TreeCache[i+1][j]), 
                                    int(Tree[i][j]) + int(TreeCache[i+1][j+1]))
    return TreeCache[0][0]
                
print(MaximumSumPath("loaddata.txt"))