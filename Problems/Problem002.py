## Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
##
## 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
##
## By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even valued terms.
##
## I'm going to attempt to abstract this to any limit value, and also accomplish with only one loop. I will also try to use as little memory as possible.
##
def SumEvenFibonacciTermsBelowN(n):
	total = 0
	terms = [1,1]
	while terms[-1] < n:
		if terms[-1] % 2 == 0:
			total += terms[-1] 
		terms.append(terms[0]+terms[1])
		terms.pop(0)
	return total

print(SumEvenFibonacciTermsBelowN(4000000))
