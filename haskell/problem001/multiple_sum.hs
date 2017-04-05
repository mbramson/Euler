import Data.List

sum_multiples :: (Foldable t, Integral a) => t a -> a -> a
sum_multiples divisors limit = sum $ filter (\x -> multipleOfAny x divisors) [1..limit-1]

multipleOfAny :: (Integral a, Foldable t) => a -> t a -> Bool
multipleOfAny n divisors = any (\x -> multipleOf x n) divisors

multipleOf :: Integral a => a -> a -> Bool
multipleOf divisor n = n `mod` divisor == 0

