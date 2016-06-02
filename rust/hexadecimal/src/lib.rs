pub fn hex_to_int(hex: &str) -> Option<i32> {
    hex.chars().fold(Some(0), is_decimal)
}

fn is_decimal(acc: Option<i32>, x: char) -> Option<i32> {
    match (acc, x) {
        (Some(a), '0'...'9') => Some(a * 16 + (x as i32) - ('0' as i32)),
        (Some(a), 'a'...'f') => Some(a * 16 + (x as i32) - ('a' as i32) + 10),
        _ => None,
    }
}
