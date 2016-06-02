
pub fn verse(n: u32) -> String {
    match n {
        0 => "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n".to_string(),
        _ => format!("{}\n{}\n", first_verse(n), second_verse(n - 1)),
    }
}

fn first_verse(n: u32) -> String {
    format!("{amount} of beer on the wall, {amount} of beer.", amount = amount(n))
}

fn second_verse(n: u32) -> String {
    format!("Take {} down and pass it around, {} of beer on the wall.", cardinal(n), amount(n))
}

fn cardinal(n: u32) -> &'static str {
    if n == 0 { return "it"; }

    "one"
}

fn amount(n: u32) -> String {
    match n {
        0 => "no more bottles".to_string(),
        1 => format!("{} bottle", n),
        _ => format!("{} bottles", n),
    }
}

pub fn sing(m: u32, n: u32) -> String {
    (n..(m + 1)).rev()
                .map(verse)
                .collect::<Vec<String>>()
                .join("\n")
}
