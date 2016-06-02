pub fn anagrams_for<'a>(word: &str, inputs: &[&'a str]) -> Vec<&'a str> {
    inputs.iter()
          .filter(|x| is_same(&x, &word) && is_anagram(&x, &word))
          .cloned()
          .collect()
}

fn is_same(a: &str, b: &str) -> bool {
    a.to_lowercase() != b.to_lowercase()
}

fn is_anagram(a: &str, b: &str) -> bool {
    sort_by_char(a) == sort_by_char(b)
}

fn sort_by_char(s: &str) -> Vec<char> {
    let mut chars: Vec<char> = s.to_lowercase().chars().collect();
    chars.sort();

    chars
}
