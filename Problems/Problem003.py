## Largest Prime Factor 

## The prime factories of 13195 are 5, 7, 13, and 29.

## What is the largest prime factor of the number 600851475143 ?

## I have solved this before, and I'd like to try solving it with a few different algorithms and compare speeds between them.

## Returns a list of prime factors of n
def PrimeFactorization(n):
	i = 2
	while i < n / 2: ## Do not need to check the divisibility of any numbers greater than half of n.
		if n % i == 0:     ## If n is evenly divisible by i
			return [i] + PrimeFactorization(n/i)
		i += 1
	return [n] ## If no evenly divisible factors are found, then this number is prime. So return it as a single member list.

num = 600851475143
primefactorlist = PrimeFactorization(num)
print(primefactorlist)
print("The Largest Prime Factor is: " + str(primefactorlist[-1]))
