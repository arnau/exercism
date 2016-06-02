use std::collections::BTreeMap;

pub struct School {
    grades: BTreeMap<u16, Vec<String>>,
}

impl School {
    pub fn new() -> Self {
        School { grades: BTreeMap::new() }
    }

    pub fn add(&mut self, grade: u16, name: &str) {
        let mut names = self.grades.entry(grade).or_insert(Vec::new());
        names.push(name.to_string());
        names.sort();
    }

    pub fn grades(&self) -> Vec<u16> {
        self.grades.keys().cloned().collect()
    }

    pub fn grade(&self, grade: u16) -> Option<&Vec<String>> {
        self.grades.get(&grade)
    }
}
