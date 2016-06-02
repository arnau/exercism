extern crate rand;

pub struct Robot {
    name: String,
}

impl Robot {
    pub fn new() -> Robot {
        Robot { name: gen_name() }
    }

    pub fn name(&self) -> &str {
        &self.name
    }

    pub fn reset_name(&mut self) {
        self.name = gen_name();
    }
}


fn gen_name<'a>() -> String {
    let mut rng = rand::thread_rng();
    let letter_fragment = rand::sample(&mut rng, b'A'..b'Z', 2);
    let number_fragment = rand::sample(&mut rng, b'0'..b'9', 3);

    let name = format!("{}{}", String::from_utf8(letter_fragment).unwrap(),
                               String::from_utf8(number_fragment).unwrap());

    name
}
