module ColumnSpec (spec) where

import Test.Hspec

spec :: Spec
spec = do
  describe "dummy" $ do
    it "dummy" $ do
      True `shouldBe` True

