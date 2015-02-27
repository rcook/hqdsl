module ContextSpec (spec) where

import Test.Hspec
import Context (Context)
import qualified Context

spec :: Spec
spec = do
  describe "Context.create" $ do
    it "has expected next key" $ do
      let
        ctx = Context.create 100
        (id0, ctx') = Context.nextKey ctx
        (id1, ctx'') = Context.nextKey ctx'
        (id2, ctx''') = Context.nextKey ctx''
      id0 `shouldBe` 100
      id1 `shouldBe` 101
      id2 `shouldBe` 102

    it "has expected next key with foldr" $ do
      let
        ctx = Context.create 1000
        (result, ctx') =
          foldr helper ([], ctx) [1..3]
            where
              helper i (pairs, ctx) =
                let
                  (id, ctx') = Context.nextKey ctx
                in
                  ((i, id) : pairs, ctx')
      result `shouldBe` [(1, 1002), (2, 1001),(3, 1000)]

