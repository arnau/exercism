module Strain exposing (..)

discard : (a -> Bool) -> List a -> List a
discard f xs =
  keep (not << f) xs

keep : (a -> Bool) -> List a -> List a
keep f xs =
  test f (xs, [])

test : (a -> Bool) -> (List a, List a) -> List a
test f (xs, xs') =
  case (xs, xs') of
    ([], []) -> []

    ([], xs') ->
      List.reverse xs'

    (x::xs, xs') ->
      test f (xs, if f x then x::xs' else xs')
