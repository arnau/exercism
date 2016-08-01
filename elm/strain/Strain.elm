module Strain exposing (..)

discard : (a -> Bool) -> List a -> List a
discard f xs =
  keep (not << f) xs

keep : (a -> Bool) -> List a -> List a
keep f xs =
  case xs of
    [] -> []

    x :: xs ->
      if f x then
        x :: keep f xs
      else
        keep f xs
