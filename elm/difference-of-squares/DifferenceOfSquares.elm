module DifferenceOfSquares exposing (..)


squareOfSum: number -> number
squareOfSum n =
  (List.sum [1 .. n]) ^ 2

sumOfSquares: number -> number
sumOfSquares n =
  List.sum <| List.map (\x -> x ^ 2) [1 .. n]

difference : number -> number
difference n =
  (squareOfSum n) - (sumOfSquares n)
