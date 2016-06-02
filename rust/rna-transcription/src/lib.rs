use std::str::FromStr;

enum Nucleotide {
    A,
    C,
    G,
    T,
    U,
}

impl FromStr for Nucleotide {
    type Err = String;

    fn from_str(seq: &str) -> Result<Self, String> {
        use self::Nucleotide::*;

        Ok(seq.chars()
           .map(|x| {
                match x {
                    'A' => Nucleotide::A,
                    'C' => Nucleotide::C,
                    'G' => Nucleotide::G,
                    'T' => Nucleotide::T,
                    'U' => Nucleotide::U,
                    _ => return Err("foo"),
                }
           }).collect())
    }
}

#[derive(Debug, PartialEq)]
pub struct RibonucleicAcid(Vec<Nucleotide>);

impl RibonucleicAcid {
    pub fn new(seq: &str) -> Self {
        RibonucleicAcid(FromStr::from_str(seq).unwrap())
    }
}

#[derive(Debug, PartialEq)]
pub struct DeoxyribonucleicAcid(Vec<Nucleotide>);

impl DeoxyribonucleicAcid {
    pub fn new(seq: &str) -> Self {
        DeoxyribonucleicAcid(FromStr::from_str(seq).unwrap())
    }

    pub fn to_rna(&self) -> RibonucleicAcid {
        RibonucleicAcid(as_rna(FromStr::from_str(&self.0).unwrap()))
    }
}

fn as_rna(seq: Vec<Nucleotide>) -> Vec<Nucleotide> {
    seq.into_iter()
       .map(|x| {
           match x {
               Nucleotide::C => Nucleotide::G,
               Nucleotide::G => Nucleotide::C,
               Nucleotide::A => Nucleotide::U,
               Nucleotide::T => Nucleotide::A,
           }
       }).collect()
}
