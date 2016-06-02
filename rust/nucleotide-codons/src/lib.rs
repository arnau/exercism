#[derive(Debug, Clone)]
pub struct Codons {
    pairs: Vec<(&'static str, &'static str)>,
}

pub fn parse(pairs: Vec<(&'static str, &'static str)>) -> Codons {
    Codons { pairs: pairs }
}


impl Codons {
    pub fn name_for(&self, seq: &'static str) -> Result<&'static str, &'static str> {
        let seq: String = seq.chars().map(normalize).collect();

        self.pairs.clone().into_iter()
                  .find(|&(codon, _)| codon == seq)
                  .map(|(_, name)| name)
                  .ok_or("Unknown codon")
    }
}

// Reduced the exapnsion table to the bare minimum given only the first match
// from the expansion table is used.
//
// See: https://en.wikipedia.org/wiki/Nucleic_acid_notation
fn normalize(base: char) -> char {
    match base {
        'W' | 'M' | 'R' | 'D' | 'H' | 'V' | 'N' => 'A',
        'S' | 'Y' | 'B'  => 'C',
        'K' => 'G',
        _ => base
    }
}
