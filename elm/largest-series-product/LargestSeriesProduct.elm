module LargestSeriesProduct exposing (largestProduct)

import String


largestProduct : Int -> String -> Maybe Int
largestProduct n seq =
  if n == 0 then
    Just 1
  else if n < 0 then
    Nothing
  else
    String.split "" seq
      |> List.map (Result.toMaybe << String.toInt)
      |> combineMaybe
      |> Maybe.map (groupBy n)
      |> Maybe.map (List.filterMap (product n))
      |> (flip Maybe.andThen) List.maximum


groupBy : Int -> List a -> List (List a)
groupBy n xs =
  case xs of
    [] ->
      []

    _ ->
      (List.take n xs) :: (groupBy n (List.drop 1 xs))


product : Int -> List Int -> Maybe Int
product n xs =
  if List.length xs == n then
    Just (List.product xs)
  else
    Nothing


combineMaybe : List (Maybe a) -> Maybe (List a)
combineMaybe =
  List.foldr (Maybe.map2 (::)) (Just [])
