module TableSpec (spec) where

import Test.Hspec
import qualified Table

spec :: Spec
spec = do
  describe "Table.name" $ do
    it "gets name of table" $ do
      Table.name (Table.create "name" ["a", "b"]) `shouldBe` "name"

  describe "Table.columnNames" $ do
    it "gets column names of table" $ do
      Table.columnNames (Table.create "name" ["a", "b"]) `shouldBe` ["a", "b"]

