module Series exposing (..)

import String

slices : Int -> String -> Result String (List (List Int))
slices n string =
  if n == 0 then
    Err ("Invalid size: 0")
  else
    string
      |> String.split ""
      |> List.map String.toInt
      |> combineResult
      |> Result.map (sliceBy n)


sliceBy : Int -> List Int -> List (List Int)
sliceBy n xs =
  if n > List.length xs then
    []
  else
    (List.take n xs) :: sliceBy n (List.drop 1 xs)


combineResult : List (Result x a) -> Result x (List a)
combineResult =
  List.foldr (Result.map2 (::)) (Ok [])
