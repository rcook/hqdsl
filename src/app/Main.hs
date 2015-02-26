module Main where

import Widget (Widget)
import qualified Widget

main = do
  let
    widget = Widget.create
      "Triple-contact electromagnet"
      ["Flashing lights", "Lever"]
  putStrLn $ show widget

