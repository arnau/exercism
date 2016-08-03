module RNATranscription exposing (..)

import String
import Result

toRNA : String -> Result Char String
toRNA dna =
  String.toList dna
    |> List.map transcript
    |> List.foldr (\x rna -> Result.map2 String.cons x rna) (Ok "")

transcript : Char -> Result Char Char
transcript nucleotide =
  case nucleotide of
    'G' -> Ok 'C'
    'C' -> Ok 'G'
    'T' -> Ok 'A'
    'A' -> Ok 'U'
    n   -> Err n


