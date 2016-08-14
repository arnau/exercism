module RomanNumerals exposing (toRoman)

type alias Atom =
  (Int, String)

atoms : List Atom
atoms =
  [ (1000, "M")
  , (900, "CM")
  , (500, "D")
  , (400, "CD")
  , (100, "C")
  , (90, "XC")
  , (50, "L")
  , (40, "XL")
  , (10, "X")
  , (9, "IX")
  , (5, "V")
  , (4, "IV")
  , (1, "I")
  ]


toRoman : Int -> String
toRoman x =
  if x <= 0 then
    ""
  else
    toRoman' x (findMax x atoms)


toRoman' : Int -> Atom -> String
toRoman' x (decimal, roman) =
  roman ++ toRoman (x - decimal)


findMax : Int -> List Atom -> Atom
findMax x xs =
  List.filter (isInRangeOf x) xs
    |> List.maximum
    |> Maybe.withDefault (0, "")


isInRangeOf : Int -> Atom -> Bool
isInRangeOf x (decimal, roman) =
  decimal <= x
