##
## If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3,5,6 and 9, The sum of these multiples is 23.
## Find the sum of all the multiples of 3 or 5 below 1000.
##
## Returns all multiples of a or b that are below n.

def Multiples(a,b,n):
    mlts = []
    aa = a
    bb = b
    while (aa<n):
        mlts.append(aa)
        aa += a
    while (bb<n):
        mlts.append(bb)
        bb += b
    mlts.sort()
    c = 0
    while (c < len(mlts)-2):
        if mlts[c] == mlts[c+1]:
            mlts.pop(c)
            continue
        c += 1
    return mlts

print(sum(Multiples(3,5,1000)))
	
