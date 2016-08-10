module GradeSchool exposing (..)

import Dict exposing (Dict)

type alias School =
  Dict Int (List String)


empty : School
empty =
  Dict.empty


addStudent : Int -> String -> School -> School
addStudent grade name school =
  Dict.insert grade
              (name :: (studentsInGrade grade school))
              school

studentsInGrade : Int -> School -> List String
studentsInGrade grade school =
  List.sort (Maybe.withDefault [] (Dict.get grade school))


allStudents : School -> List (Int, List String)
allStudents school =
  Dict.toList school
