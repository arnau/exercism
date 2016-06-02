pub fn hello(name: Option<&str>) -> String {
    let x = if let Some(s) = name { s } else { "World" };

    format!("Hello, {}!", x)
}
