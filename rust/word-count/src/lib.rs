use std::collections::HashMap;

pub fn word_count(input: &str) -> HashMap<String, u32> {
    input.to_lowercase()
         .split(|c: char| !c.is_alphanumeric())
         .filter(|x| !x.is_empty())
         .fold(HashMap::new(), |mut acc, word| {
            let amount = acc.get(word).unwrap_or(&0) + 1;
            acc.insert(word.to_string(), amount);
            acc
         })
}
