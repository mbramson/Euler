##2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

##What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

##First, my solution that works, but isn't anything special:

## Returns the smallest number that can be divided by each of the numbers from 1 to n
## Note this function has absurdly bad performance For cases where n is ~ >= 17. This is brute force with 0 optomization

def SmallestCommonDivisorBrute(n):
    found=False
    x = n - 1
    while found==False:
        x += 1
        for div in range(2,n+1):
            if x % div != 0:
                break
            if div == n:
                found=True
                break  
    return x

print(SmallestCommonDivisorBrute(17))
                