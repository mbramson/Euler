## Largest Prime Factor 

## The prime factories of 13195 are 5, 7, 13, and 29.

## What is the largest prime factor of the number 600851475143 ?

## I have solved this before, and I'd like to try solving it with a few different algorithms and compare speeds between them.


num = 600851475143
num = 8300
## Returns a list of prime factors of n
def PrimeFac(n):
	i = 2
	while i < int(n**0.5)+1: ## Do not need to check the divisibility of any numbers greater than the square root of n
		if n % i == 0:     ## If n is evenly divisible by i
			return [i] + PrimeFac(n/i)
		i += 1
	return [n] ## If no evenly divisible factors are found, then this number is prime. So return it as a single member list.

primefactorlist = PrimeFac(num)
print(primefactorlist)
print("The Largest Prime Factor is: " + str(primefactorlist[-1]))

## Another method is to first generate a list of primes up to n / 2. Instead of simply counting up to n / 2, we iterate this list until an even divisor is found.

## This function will generate a list of primes below n, starting with 2.
## It is not optomized whatsoever, it just works.
def primesnaive(n):
	c = 2
	primes = []
	while c < n/2+1:
		for i in range(2,c/2+2):
			if c % i == 0:
				break
			if i == c/2:
				primes.append(c)
		c += 1
	return [2,3] + primes
				
def PrimeFac2(n):
	primelist = primesnaive(n/2)
	for i in primelist:
		if n % i == 0:
			return [i] + PrimeFac2(n/i)
	return [n]

primefactorlist2 = PrimeFac2(num)
print(primefactorlist2)
print("Larges Prime (PrimeFac2): " + str(primefactorlist2[-1]))

## This function will generate a list of primes below n, starting with 2.
## This was not my original work. I wanted to compare the original problem and this algo is beyond my scope for the problem.
## This was found at stackoverflow.com/questions/2067372
## NOTE: This function does not work for numbers that are too big. It does not accept numbers of type Long.
def primes(n):
	n, correction = n-n%6+6, 2-(n%6>1)
	sieve = [True] * (n/3)
	for i in xrange(1,int(n**0.5)/3+1):
		if sieve[i]:
			k = 3*i + 1|1
			sieve[    k*k/3        ::2*k] = [False] * ((n/6-k*k/6-1)/k+1)
			sieve[k*(k-2*(i&1)+4)/3::2*k] = [False] * ((n/6-k*(k-2*(i&1)+4)/6-1)/k+1)
	return [2,3] + [3*i+1|1 for i in xrange(1,n/3-correction) if sieve[i]]



## The following method is the same as PrimeFac, except it only iterates through primes.
def PrimeFac3(n):
	for i in primes(int(n**0.5)+1):
		if n % i == 0:
			return [i] + PrimeFac3(n/i)
	return [n]

primefactorlist3 = PrimeFac3(num)
print(primefactorlist3)
print("Largest Prime (PrimeFac3): " + str(primefactorlist3[-1]))
