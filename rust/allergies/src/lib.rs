#[derive(Debug, Clone, PartialEq)]
pub enum Allergen {
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,
    Chocolate = 32,
    Pollen = 64,
    Cats = 128,
}

pub struct Allergies(u32);

impl Allergies {
    pub fn new(score: u32) -> Self {
        Allergies(score)
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        allergen.clone() as u32 & self.0 != 0
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        vec![Allergen::Eggs,
             Allergen::Peanuts,
             Allergen::Shellfish,
             Allergen::Strawberries,
             Allergen::Tomatoes,
             Allergen::Chocolate,
             Allergen::Pollen,
             Allergen::Cats].into_iter()
                            .filter(|x| self.is_allergic_to(&x))
                            .collect()
    }
}
