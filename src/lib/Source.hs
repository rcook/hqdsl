module Source
(
  Source,
  create,
  table
)
where

import Table (Table)
import qualified Table

data Source =
  Source Table
  deriving (Eq, Ord, Show)

create :: Table -> Source
create t = Source t

table :: Source -> Table
table (Source t) = t

