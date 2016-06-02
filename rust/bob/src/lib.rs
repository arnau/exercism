pub fn reply(input: &str) -> &str {
    match input {
        _ if input.is_empty() => "Fine. Be that way!",
        _ if input.ends_with('?') => "Sure.",
        _ if input.to_uppercase() == input => "Whoa, chill out!",
        _ => "Whatever.",
    }
}
