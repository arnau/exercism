pub fn score(word: &str) -> u32 {
    word.to_lowercase()
        .chars()
        .map(to_value)
        .fold(0, |sum, x| sum + x)
}

fn to_value(letter: char) -> u32 {
    match letter {
        'a' | 'e' | 'i' | 'o' | 'u' | 'l' | 'n' | 'r' | 's' | 't' => 1,
        'd' | 'g' => 2,
        'b' | 'c' | 'm' | 'p' => 3,
        'f' | 'h' | 'v' | 'w' | 'y' => 4,
        'k' => 5,
        'j' | 'x' => 8,
        'q' | 'z' => 10,
        _ => 0,
    }
}
