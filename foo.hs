import Data.Map (Map)
import qualified Data.Map as Map

data Context = Context Int deriving Show

annotate :: Ord a => ([a], Context) -> (Map a Int, Context)
annotate (xs, ctx) =
  foldl
    (\(m, Context id) item -> (Map.insert item id m, Context (id + 1)))
    (Map.empty, ctx)
    xs

main :: IO ()
main = do
  let
    ctx = Context 1000
    (m, ctx') = annotate (["one", "two", "three", "four", "five"], ctx)
  putStrLn $ show m

