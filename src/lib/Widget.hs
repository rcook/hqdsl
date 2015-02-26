module Widget
(
  Widget,
  create,
  name,
  components
)
where

data Widget =
  Widget String [String]
  deriving Show

create :: String -> [String] -> Widget
create name components = Widget name components

name :: Widget -> String
name (Widget name _) = name

components :: Widget -> [String]
components (Widget _ components) = components

