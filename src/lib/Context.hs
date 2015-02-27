module Context
(
  Context,
  create,
  nextKey
)
where

data Context =
  Context Int
  deriving Show

create :: Int -> Context
create k = Context k

nextKey :: Context -> (Int, Context)
nextKey (Context k) = (k, Context (k + 1))

