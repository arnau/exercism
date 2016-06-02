pub fn primes_up_to(n: usize) -> Vec<usize> {
    (2..).take(n)
         .fold((2..(n + 1)).collect(), filter_valid)
}

fn filter_valid(xs: Vec<usize>, i: usize) -> Vec<usize> {
    xs.into_iter()
      .filter(|&x| x == i || x % i != 0)
      .collect()
}
