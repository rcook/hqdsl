module Column
(
  Column,
  create,
  boundSource,
  name
)
where

import BoundSource (BoundSource)

data Column =
  Column BoundSource String
  deriving Show

create :: BoundSource -> String -> Column
create b name = Column b name

boundSource :: Column -> BoundSource
boundSource (Column b _) = b

name :: Column -> String
name (Column _ n) = n

