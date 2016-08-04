module RNATranscription exposing (..)

import String
import Result

toRNA : String -> Result Char String
toRNA dna =
  case String.uncons dna of
    Nothing ->
      Ok ""

    Just (nucleotide, chain) ->
      Result.map2 String.cons (transcript nucleotide) (toRNA chain)


transcript : Char -> Result Char Char
transcript nucleotide =
  case nucleotide of
    'G' ->
      Ok 'C'

    'C' ->
      Ok 'G'

    'T' ->
      Ok 'A'

    'A' ->
      Ok 'U'

    _ ->
      Err nucleotide
