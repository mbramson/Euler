// The Fibonacci sequence is defined by the recurrence relation:

// Fn = F(n-1) + F(n-2), where F1 = 1 and F2 = 2

// Hence the first 12 terms will be:

// F1 = 1
// F2 = 1
// F3 = 2
// F4 = 3
// F5 = 5
// F6 = 8
// F7 = 13
// F8 = 21
// F9 = 34
// F10 = 55
// F11 = 89
// F12 = 144

// The 12th term, F12, is the first term to contain three digits.
// What is the index of the first term in the Fibonacci sequence to contain
// 1000 digits?

extern crate num;

use std::io;
use num::{BigUint};
use num::bigint::ToBigUint;


fn main() {
    println!("Please specify the number of digits:");

    let mut digits = String::new();
    io::stdin().read_line(&mut digits).ok().expect("Failed to read line");
    let digits: u32 = digits.trim().parse().expect("Expected Integer");

    println!("The term index of the first fibonacci number with");
    println!("{} digits is: {}", digits,
             get_first_fibonacci_term_number_with_digits(digits));

}

fn get_first_fibonacci_term_number_with_digits(digits: u32) -> BigUint {
    return 12.to_biguint().unwrap();
}

#[test]
fn test_3_digits() {
    assert_eq!(12.to_biguint().unwrap(), get_first_fibonacci_term_number_with_digits(3));
}

#[test]
fn test_17_digits() {
assert_eq!(79, get_first_fibonacci_term_number_with_digits(17));
}

fn get_num_digits(n: BigUint) -> usize {
    return n.to_string().len();
}

#[test]
fn test_get_num_digits_5_digits() {
    assert_eq!(5, get_num_digits(12345.to_biguint().unwrap()));
}

#[test]
fn test_get_num_digits_20_digits() {
    let a: BigUint = "12345678901234567890".parse::<BigUint>().unwrap();
    assert_eq!(20, get_num_digits(a));
}

