use std::fmt::{Display, Formatter, Result};

pub struct Roman(u32);

const PAIRS: [(&'static str, u32); 13] = [("M", 1000),
                                          ("CM", 900),
                                          ("D", 500),
                                          ("CD", 400),
                                          ("C", 100),
                                          ("XC", 90),
                                          ("L", 50),
                                          ("XL", 40),
                                          ("X", 10),
                                          ("IX", 9),
                                          ("V", 5),
                                          ("IV", 4),
                                          ("I", 1)];

impl Roman {
    pub fn from(n: u32) -> Roman {
        Roman(n)
    }
}

impl Display for Roman {
    fn fmt(&self, f: &mut Formatter) -> Result {
        let mut x = self.0;

        while x > 0 {
            let &(numeral, value) = PAIRS.into_iter()
                                         .find(|&&(_, decimal)| decimal <= x)
                                         .unwrap();
            x = x - value;

            try!(write!(f, "{}", numeral));
        }

        Ok(())
    }
}
