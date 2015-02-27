module From
(
  From,
  create,
  table,
  innerJoins
)
where

import Table (Table)
import InnerJoin (InnerJoin)

data From =
  From Table [InnerJoin]
  deriving Show

create :: Table -> [InnerJoin] -> From
create t innerJoins = From t innerJoins

table :: From -> Table
table (From t _) = t

innerJoins :: From -> [InnerJoin]
innerJoins (From _ js) = js

