use std::collections::BTreeMap;

pub fn transform(input: &BTreeMap<i32, Vec<String>>) -> BTreeMap<String, i32> {
    input.into_iter().fold(BTreeMap::new(), |mut acc, (&score, letters)| {
        for letter in letters.into_iter() {
            acc.insert(letter.clone().to_lowercase(), score);
        }

        acc
    })
}
