module Triangle exposing (..)

type Triangle a
  = Equilateral (a, a, a)
  | Isosceles
  | Scalene

triangleKind : number -> number -> number -> Result String String
triangleKind a b c =
  if hasInvalidLengths a b c then
    Err "Invalid lengths"
  else if isInequal a b c then
    Err "Violates inequality"
  else if isEquilateral a b c then
    Ok "equilateral"
  else if isIsosceles a b c then
    Ok "isosceles"
  else
    Ok "scalene"


isNegative : number -> Bool
isNegative n =
  n < 0

hasInvalidLengths : number -> number -> number -> Bool
hasInvalidLengths a b c =
  List.any isNegative [a, b, c] || (List.all (\x -> x == 0) [a, b, c])

isInequal : number -> number -> number -> Bool
isInequal a b c =
  a + b <= c || a + c <= b || b + c <= a

isEquilateral : number -> number -> number -> Bool
isEquilateral a b c =
  a == b && a == c


isIsosceles : number -> number -> number -> Bool
isIsosceles a b c =
  b == c || a == c || a == b
