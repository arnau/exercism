use std::collections::HashMap;

pub fn count(c: char, xs: &str) -> usize {
    xs.chars().filter(|&x| x == c).count()
}

pub fn nucleotide_counts(seq: &str) -> HashMap<char, usize> {
    ['A', 'T', 'C', 'G'].into_iter()
                        .map(|&c| (c, count(c, seq)))
                        .collect()
}
