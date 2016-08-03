module SumOfMultiples exposing (..)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples xs n =
  [1 .. (n - 1)]
    |> List.filter (byMultiplesOf xs)
    |> List.sum

byMultiplesOf xs a =
  List.any (isMultiple a) xs

isMultiple a b =
  a % b == 0
