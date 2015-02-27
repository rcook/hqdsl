module Views
(
  BoundSourceV (BoundSourceV),
  ColumnV (ColumnV),
  FromV (FromV),
  SelectV (SelectV),
  SourceV (SourceV),
  TableV (TableV),
  boundSourceV,
  columnV,
  fromV,
  selectV,
  sourceV,
  tableV
)
where

import qualified BoundSource
import qualified Column
import qualified From
import qualified InnerJoin
import qualified Select
import qualified Source
import qualified Table

data BoundSourceV = BoundSourceV Source.Source Int
boundSourceV :: BoundSource.BoundSource -> BoundSourceV
boundSourceV b = BoundSourceV (BoundSource.source b) (BoundSource.key b)

data ColumnV = ColumnV BoundSource.BoundSource String
columnV :: Column.Column -> ColumnV
columnV c = ColumnV (Column.boundSource c) (Column.name c)

data FromV = FromV Table.Table [InnerJoin.InnerJoin]
fromV :: From.From -> FromV
fromV f = FromV (From.table f) (From.innerJoins f)

data SelectV = SelectV Select.Selector From.From
selectV :: Select.Select -> SelectV
selectV s = SelectV (Select.selector s) (Select.from s)

data SourceV = SourceV Table.Table
sourceV :: Source.Source -> SourceV
sourceV s = SourceV (Source.table s)

data TableV = TableV String [String]
tableV :: Table.Table -> TableV
tableV t = TableV (Table.name t) (Table.columnNames t)

