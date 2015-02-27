module BoundSourceSpec (spec) where

import Test.Hspec
import BoundSource (BoundSource)
import qualified BoundSource
import Context (Context)
import qualified Context
import Source (Source)
import qualified Source
import Table (Table)
import qualified Table

spec :: Spec
spec = do
  describe "BoundSource.create" $ do
    it "has expected key" $ do
      let
        t = Table.create "name" ["a", "b"]
        s = Source.create t
        ctx = Context.create 1000
        (boundSource0, ctx') = BoundSource.create s ctx
        (boundSource1, ctx'') = BoundSource.create s ctx'
      (BoundSource.key $ boundSource0) `shouldBe` 1000
      (BoundSource.key $ boundSource1) `shouldBe` 1001

