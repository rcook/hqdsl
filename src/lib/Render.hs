{-# LANGUAGE ViewPatterns #-}

module Render
(
  render
)
where

import Data.Map (Map)
import qualified Data.Map as Map
import Data.List
import Text.Printf (printf)

import qualified BoundSource
import qualified Column
import qualified Context
import qualified InnerJoin
import qualified RenderResult
import qualified Scope
import qualified Select
import qualified Source
import qualified Table

import Views

renderColumns ::
  RenderResult.RenderResult ->
  [Column.Column] ->
  Scope.Scope ->
  Context.Context ->
  (RenderResult.RenderResult, Context.Context)
renderColumns _ columns _ ctx =
  let
    rs = map renderColumn columns
  in
    (RenderResult.create (intercalate ", " (map RenderResult.sql rs)) (concat $ map RenderResult.messages rs), ctx)
  where
    renderColumn :: Column.Column -> RenderResult.RenderResult
    renderColumn
      (columnV ->
        ColumnV (boundSourceV
          -> BoundSourceV (sourceV
            -> SourceV (tableV
              -> TableV tableName tableColumnNames)) key) columnName) =
      if elem columnName tableColumnNames
      then RenderResult.create (printf "_%02d.%s" key columnName) []
      else RenderResult.create "???" [printf "Unknown column name %s on table %s" columnName tableName]

render ::
  Select.Select ->
  RenderResult.RenderResult
render (selectV -> SelectV selector (fromV -> FromV t innerJoins)) =
  let
    tables = t : map InnerJoin.table innerJoins
    sources = map Source.create tables

    ctx = Context.create 0
    (bs, ctx') = foldr f ([], ctx) sources
      where
        f :: Source.Source -> ([BoundSource.BoundSource], Context.Context) -> ([BoundSource.BoundSource], Context.Context)
        f s (bs, ctx) =
          let
            (b, ctx') = BoundSource.create s ctx
          in
            (b : bs, ctx')

    columns = selector bs
    (scope, ctx'') = Scope.create sources ctx'
    (rr, ctx''') = renderColumns (RenderResult.create "" []) columns scope ctx''

    selectorSql = RenderResult.sql rr
    messages = RenderResult.messages rr

    fromSql : innerJoinSqls = map f bs
      where
        f :: BoundSource.BoundSource -> String
        f b = printf "%s AS _%02d" (Table.name $ Source.table $ BoundSource.source b) (BoundSource.key b)

    selectFragment = (printf "SELECT %s FROM %s" selectorSql fromSql)
    innerJoinFragments = map (printf "INNER JOIN %s ON ()") innerJoinSqls

    sql =
      intercalate
        " "
        (selectFragment : innerJoinFragments)
  in
    RenderResult.create sql messages

