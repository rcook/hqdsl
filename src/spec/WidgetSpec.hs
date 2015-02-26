module WidgetSpec (spec) where

import Test.Hspec
import qualified Widget

spec :: Spec
spec = do
  describe "Validate Widget.create function" $ do
    it "What about the sonic oscillator?" $ do
      let
        w = Widget.create
          "Triple-contact electromagnet"
          ["Flashing lights", "Lever"]
      Widget.name w `shouldBe` "Triple-contact electromagnet"

