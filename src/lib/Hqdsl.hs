module Hqdsl
(
  Render.render,
  column,
  equals,
  from,
  innerJoin,
  select,
  table
)
where

import qualified BoundSource
import qualified Column
import qualified From
import qualified InnerJoin
import qualified Predicate
import qualified Render
import qualified Select
import qualified Table

column :: BoundSource.BoundSource -> String -> Column.Column
column = Column.create

equals :: Column.Column -> Column.Column -> Predicate.Predicate
equals = Predicate.equals

from :: Table.Table -> [InnerJoin.InnerJoin] -> From.From
from = From.create

innerJoin :: Table.Table -> InnerJoin.On -> InnerJoin.InnerJoin
innerJoin = InnerJoin.create

select :: Select.Selector -> From.From -> Select.Select
select = Select.create

table :: String -> [String] -> Table.Table
table = Table.create

