module Main where

import Hqdsl

main :: IO ()
main = do
  let
    t = table "clients" [
        "first_name",
        "middle_name",
        "last_name",
        "birthdate"
      ]
    s = select (\[t, j0, j1] -> [
        column t "first_name",
        column j0 "last_name",
        column j1 "first_namex",
        column j1 "last_name"
      ]) $
      from t [
        innerJoin t (\t0 t1 -> equals (column t0 "first_name") (column t1 "last_name")),
        innerJoin t (\t0 t1 -> equals (column t0 "first_name") (column t1 "last_name"))
      ]
  putStrLn $ show $ render s

