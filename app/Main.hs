{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib (Tag, createTag, getTag, logRecord)
import Data.Monoid ((<>))
import Web.Scotty

main :: IO ()
main = do
  putStrLn "Starting server..."
  scotty 3000 $ do
    get "/api/hello/:name" $ do
      name <- param "name"
      text ("hello " <> name <> "!")

    post "/api/tag/new" $ do
      json (createTag)

    get "/api/tag/:id" $ do
      t_id <- param "id"
      json (getTag t_id)

    get "/api/tag/:id/log" $ do
      t_id <- param "id"
      let tag = getTag t_id
      json (logRecord tag)

    get "/api/tag/" $ do
      return ()
