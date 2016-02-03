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

# Define a class which will act as a Tree node and store values.
# The value of the node is v.
# If the best outcome of child nodes is calculated for this node, v is replaced
# by that outcome and vcache is set to True.
class SaveTree(object):
    def __init__(self):
        self.v = 0
        self.vcache = False
    def __init__(self,value):
        self.v = value
        self.vcache = False
    def __str__(self):
        if hasattr(self,cleft) and hasattr(self,cright):
            return "SaveTree: %d with 2 children: %d, %d" % (self.v,cleft.v,cright.v)
        if hasattr(self,cleft) and not hasattr(self,cright):
            return "SaveTree Value: %d with 1 left child: %d" % (self.v,cleft.v)
        if hasattr(self,cright) and not hasattr(self,cleft):
            return "SaveTree Value: %d with 1 right child: %d" % (self.v,cright.v)
        return "SaveTree: %d" % (self.v)
    
    def getc():
        if vcache:
            return v
        if hasattr(self,cleft) and hasattr(self,cright):
            if cleft.getc() > cright.getc():
                return cleft.getc()
            return cright.getc()
        if hasattr(self,cleft) and not hasattr(self,cright):
            return cleft.getc()
        if hasattr(self,cright) and not hasattr(self,cleft):
            return cright.getc()
        return v

def PopulateSaveTree(TreeTextFileName):
    with open(TreeTextFileName, "r") as f:
        lines = f.readlines()
        for i in range(len(lines)):
            lines[i] = lines[i].replace("\n","").split(" ")
        treelist = [[]] #Definitely not the best way to do this
        for i in range(len(lines)):
            for j in lines[i]:
                treelist[i].append(new SaveTree(lines[i][j]))
        return lines

PopulateSaveTree("loaddata.txt")
## For this problem we can get away with loading in the Tree structure manually
## In the future, we will definitely have to automate this.
    
print PopulateSaveTree("loaddata.txt")