module RenderResult
(
  RenderResult,
  create,
  sql,
  messages
)
where

data RenderResult =
  RenderResult String [String]
  deriving Show

create :: String -> [String] -> RenderResult
create s ms = RenderResult s ms

sql :: RenderResult -> String
sql (RenderResult s _) = s

messages :: RenderResult -> [String]
messages (RenderResult _ ms) = ms

