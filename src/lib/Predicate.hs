module Predicate
(
  Predicate,
  equals
)
where

import Column (Column)

data Predicate =
  Equals Column Column
  deriving Show

equals :: Column -> Column -> Predicate
equals column0 column1 = Equals column0 column1

