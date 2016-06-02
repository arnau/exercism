pub fn number(phone: &str) -> Option<String> {
    let phone: String = phone.chars().filter(|x| x.is_numeric()).collect();

    match phone.len() {
        10 => Some(phone),
        11 => {
            if phone.starts_with("1") {
                Some(phone[1..].to_string())
            } else {
                None
            }
        }
        _ => None,
    }
}

pub fn area_code(phone: &str) -> Option<String> {
    number(phone).map(|x| x[..3].to_string())
}

pub fn pretty_print(phone: &str) -> String {
    number(phone).map(|xs| format!("({}) {}-{}", &xs[..3], &xs[3..6], &xs[6..]))
                 .unwrap_or("invalid".to_string())
}
