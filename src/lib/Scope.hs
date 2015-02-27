module Scope
(
  Scope,
  create
)
where

import Data.Map (Map)
import qualified Data.Map as Map

import Context (Context)
import qualified Context
import Source (Source)
import qualified Source

data Scope =
  Scope (Map Source Int)
  deriving Show

create :: [Source] -> Context -> (Scope, Context)
create sources ctx =
  let
    insertSource :: Source -> ((Map Source Int), Context) -> ((Map Source Int), Context)
    insertSource s (keys, ctxtemp) =
      let
        (key, ctxtemp') = Context.nextKey ctxtemp
        keys' = Map.insert s key keys
      in
        (keys', ctxtemp')
    (keys, ctx') = foldr insertSource (Map.empty, ctx) sources
    scope = Scope keys
  in
    (scope, ctx')

