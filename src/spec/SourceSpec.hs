module SourceSpec (spec) where

import Test.Hspec
import qualified Source
import qualified Table

spec :: Spec
spec = do
  describe "Source.create" $ do
    it "has table with expected name" $ do
      (Table.name $ Source.table $ Source.create $ Table.create "name" ["a", "b"]) `shouldBe` "name"

    it "has table with expected column names name" $ do
      (Table.columnNames $ Source.table $ Source.create $ Table.create "name" ["a", "b"]) `shouldBe` ["a", "b"]

