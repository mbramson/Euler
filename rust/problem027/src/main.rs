use std::io;

fn main() {
    println!("This will determine the values of a and b in the formula:");
    println!("n^2 + an + b");
    println!("that produce the maximum number of consecutive primes starting");
    println!("with n = 0.");
    println!("Please specify the maximum absolute value of coefficient a:");

    let mut a_limit = String::new();
    io::stdin().read_line(&mut a_limit).unwrap();
    let a_limit: u32 = a_limit.trim().parse().unwrap();

    println!("Please specify the maxmimum absolute value of coefficient b:");

    let mut b_limit = String::new();
    io::stdin().read_line(&mut b_limit).unwrap();
    let b_limit: u32 = b_limit.trim().parse().unwrap();

    let answer_tuple = get_a_and_b_for_max_consecutive_primes(&a_limit, &b_limit);
    println!("The values of a and b that maximize the number of consecutive primes are:");
    println!("a: {}", answer_tuple.0);
    println!("b: {}", answer_tuple.1);
}

fn get_a_and_b_for_max_consecutive_primes(a_limit: &u32, b_limit: &u32) -> (u32, u32) {
    return (1 as u32, 2 as u32);
}

//#[test]
//fn it_returns_1_and_41_for_limit_of_1_and_41() {
//    assert_eq!((1, 41), get_a_and_b_for_max_consecutive_primes(&1, &41))
//}

fn is_prime(n: u64) -> bool {
    if n == 2 { return true; }
    if n < 3 { return false; }
    let limit = (n as f64).sqrt() as u64 + 1;
    for i in 2..limit {
        if n % i == 0 { return false }
    }
    true
}

#[test]
fn is_prime_returns_prime_for_5() {
    assert_eq!(true, is_prime(5));
}

#[test]
fn is_prime_return_false_for_6() {
    assert_eq!(false, is_prime(6));
}

#[test]
fn is_prime_returns_false_for_1() {
    assert_eq!(false, is_prime(1));
}

#[test]
fn is_prime_returns_true_for_2() {
    assert_eq!(true, is_prime(2));
}

#[test]
fn is_prime_returns_true_for_11() {
    assert_eq!(true, is_prime(11));
}

#[test] fn is_prime_returns_false_for_10() {
    assert_eq!(false, is_prime(10));
}   
