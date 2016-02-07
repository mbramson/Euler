
// If we list all the natural numbers below 10 that are multiples of 3 or 5, 
// we get 3,5,6 and 9, The sum of these multiples is 23.
//
// Find the sum of all the multiples of 3 or 5 below 1000.

use std::io;

fn main() {
    println!("Please enter first multiple:");

    let mut a = String::new();

    io::stdin().read_line(&mut a)
               .ok()
               .expect("Failed to read line");

    let a: u32 = a.trim()
                  .parse()
                  .expect("Expected Integer");

    println!("Please enter second multiple:");

    let mut b = String::new();

    io::stdin().read_line(&mut b)
               .ok()
               .expect("Failed to read line");

    let b: u32 = b.trim()
                  .parse()
                  .expect("Expected Integer");

    println!("Please enter an upper limit:");

    let mut limit = String::new();

    io::stdin().read_line(&mut limit)
               .ok()
               .expect("Failed to read line");

    let limit: u32 = limit.trim()
                          .parse()
                          .expect("Expected Integer");

    let result: u32 = calculate_sum_of_multiples(a, b, limit);

    println!("The sum of all integers that are multiples of {} or {}", a, b);
    println!("that are below {} is {}", limit, result);
}

fn calculate_sum_of_multiples(a: u32, b: u32, limit: u32) -> u32 {
    let mut total: u32 = 0;
    // add all multiples of a

    let a_n: u32 = (limit - 1)/a;
    let a_total: u32 = a * (a_n) * (a_n + 1) / 2;
    total += a_total;

    if is_multiple_of(b, a) { return a_total; }

    // add all multiples of b
    let b_n: u32 = (limit - 1)/b;
    let b_total: u32 = b * (b_n) * (b_n + 1) / 2;
    total += b_total;

    if is_multiple_of(a, b) { return b_total; }

    // subtract out all multiples of a * b since we've double counted them
    let ab_n: u32 = (limit - 1) / (a*b);
    total -= a * b * (ab_n) * (ab_n + 1) / 2;

    return total;
}

#[test]
fn test_original_example_returns_correctly() {
    assert_eq!(23, calculate_sum_of_multiples(3, 5, 10));
}

#[test]
fn test_b_is_multiple_of_a() {
    assert_eq!(18, calculate_sum_of_multiples(3, 6, 10));
}

#[test]
fn test_a_is_multiple_of_b() {
    assert_eq!(56, calculate_sum_of_multiples(6, 2, 15));
}

#[test]
fn test_a_is_equal_to_b() {
    assert_eq!(12 , calculate_sum_of_multiples(2, 2, 8));
}

fn is_multiple_of(a: u32, b:u32) -> bool {
    if a % b == 0 {
        return true;
    } else {
        return false;
    }
}

#[test]
#[should_panic]
fn test_is_multiple_of_returns_false_if_b_is_multiple_of_a() {
    assert!(is_multiple_of(7, 14), "7 is not a multiple of 14");
}

#[test]
fn test_is_multiple_of_returns_true_if_a_is_multiple_of_b() {
    assert!(is_multiple_of(10, 5), "10 is a multiple of 5");
}

#[test]
#[should_panic]
fn test_is_multiple_of_returns_false_if_not_multiple() {
    assert!(is_multiple_of(3, 5), "5 is not a multiple of 3");
}
