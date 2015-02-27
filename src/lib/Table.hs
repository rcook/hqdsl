module Table
(
  Table,
  create,
  name,
  columnNames
)
where

data Table =
  Table String [String]
  deriving (Eq, Ord, Show)

create :: String -> [String] -> Table
create name columnNames = Table name columnNames

name :: Table -> String
name (Table name _) = name

columnNames :: Table -> [String]
columnNames (Table _ columnNames) = columnNames

