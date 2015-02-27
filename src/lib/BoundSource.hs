module BoundSource
(
  BoundSource,
  create,
  key,
  source
)
where

import Context (Context)
import qualified Context
import Source (Source)

data BoundSource =
  BoundSource Int Source
  deriving Show

create :: Source -> Context -> (BoundSource, Context)
create s ctx =
  let
    (id, ctx') = Context.nextKey ctx
  in
    (BoundSource id s, ctx')

key :: BoundSource -> Int
key (BoundSource k _) = k

source :: BoundSource -> Source
source (BoundSource _ s) = s

