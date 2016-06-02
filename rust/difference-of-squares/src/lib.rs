pub fn difference(n: usize) -> usize {
    square_of_sum(n) - sum_of_squares(n)
}

pub fn square_of_sum(n: usize) -> usize {
    (1usize..).take(n)
              .fold(0, |sum, x| sum + x)
              .pow(2)
}

pub fn sum_of_squares(n: usize) -> usize {
    (1usize..).take(n)
              .fold(0, |sum, x| sum + x.pow(2))
}
