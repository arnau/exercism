module ListOps exposing (..)

length : List a -> Int
length xs =
  foldr (\_ n -> n + 1) 0 xs


reverse : List a -> List a
reverse xs =
  foldl (::) [] xs


map : (a -> b) -> List a -> List b
map fn xs =
  foldr (\x acc -> fn x :: acc) [] xs


filter : (a -> Bool) -> List a -> List a
filter fn xs =
  foldr (\x acc -> if fn x then x :: acc else acc) [] xs


foldl : (a -> b -> b) -> b -> List a -> b
foldl fn b xs =
  case xs of
    [] -> b
    x :: xs' ->
      foldl fn (fn x b) xs'


foldl' : (a -> b -> b) -> b -> List a -> b
foldl' fn b xs =
  case xs of
    [] -> b
    x :: xs' ->
      foldl' fn (fn x b) xs'


foldr : (a -> b -> b) -> b -> List a -> b
foldr fn b xs =
  case xs of
    [] -> b
    x :: xs' ->
      fn x (foldr fn b xs')


append : List a -> List a -> List a
append xs ys =
  foldr (::) ys xs


concat : List (List a) -> List a
concat xs =
  foldr append [] xs
