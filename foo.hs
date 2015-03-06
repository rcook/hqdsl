{-
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
-}

newtype State s a = State { runState :: s -> (a, s) }

fromStoAandS :: Int -> (String, Int)
fromStoAandS c | c `mod` 5 == 0 = ("foo", c + 1)
               | otherwise = ("bar", c + 1)

stateIntString :: State Int String
stateIntString = State fromStoAandS

main :: IO ()
main = do
  let
    r = runState stateIntString 1
  putStrLn $ show r

