module Accumulate exposing (..)

accumulate : (a -> b) -> List a -> List b
accumulate fn xs =
  case xs of
    [] -> []
    x::xs ->
      (fn x) :: accumulate fn xs
