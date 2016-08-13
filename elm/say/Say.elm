module Say exposing (say, SayError(..))

import Dict exposing (Dict)
import String


type SayError
  = Negative
  | TooLarge


atoms : Dict Int String
atoms =
  Dict.fromList [ (0, "zero")
                , (1, "one")
                , (2, "two")
                , (3, "three")
                , (4, "four")
                , (5, "five")
                , (6, "six")
                , (7, "seven")
                , (8, "eight")
                , (9, "nine")
                , (10, "ten")
                , (11, "eleven")
                , (12, "twelve")
                , (13, "thirteen")
                , (14, "fourteen")
                , (15, "fifteen")
                , (16, "sixteen")
                , (17, "seventeen")
                , (18, "eighteen")
                , (19, "nineteen")
                , (20, "twenty")
                , (30, "thirty")
                , (40, "forty")
                , (50, "fifty")
                , (60, "sixty")
                , (70, "seventy")
                , (80, "eighty")
                , (90, "ninety")
                , (100, "hundred")
                , (1000, "thousand")
                , (1000000, "million")
                , (1000000000, "billion")
                , (1000000000000, "trillion")
                ]


say : Int -> Result SayError String
say n =
  translate n

translate : Int -> Result SayError String
translate n =
  if n < 0 then
    Err Negative

  else if n < 20 then
    fromAtomic n

  else if n < 100 then
    if n % 10 == 0 then
      fromAtomic n
    else
      resultJoin2 "-"
                  (translate ((n // 10) * 10))
                  (fromAtomic (n % 10))

  else if n < 1000 then
    fromLargeNumber n (1000 // 10)

  else if n < 1000000 then
    fromLargeNumber n (1000000 // 1000)

  else if n < 1000000000 then
    fromLargeNumber n (1000000000 // 1000)

  else if n < 1000000000000 then
    fromLargeNumber n (1000000000000 // 1000)

  else
    Err TooLarge


fromLargeNumber : Int -> Int -> Result SayError String
fromLargeNumber n m =
  if n % m == 0 then
    resultJoin2 " "
                (translate (n // m))
                (fromAtomic (n // (n // m)))
  else
    resultJoin2 (separator (n % m))
                (translate (n - (n % m)))
                (translate (n % m))


separator : Int -> String
separator n =
  if n < 100 then
    " and "
  else
    " "


fromAtomic : Int -> Result SayError String
fromAtomic n =
  Result.fromMaybe (TooLarge) (Dict.get n atoms)


resultJoin2 : String 
           -> Result SayError String
           -> Result SayError String
           -> Result SayError String
resultJoin2 separator a b =
  Result.map3 (\x y z -> x ++ y ++ z) a (Ok separator) b
