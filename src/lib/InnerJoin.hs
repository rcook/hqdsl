module InnerJoin
(
  InnerJoin,
  On,
  create,
  table
)
where

import Text.Show.Functions

import BoundSource (BoundSource)
import Predicate (Predicate)
import Table (Table)

type On = BoundSource -> BoundSource -> Predicate

data InnerJoin =
  InnerJoin Table On
  deriving Show

create :: Table -> On -> InnerJoin
create t on = InnerJoin t on

table :: InnerJoin -> Table
table (InnerJoin t _) = t

