{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib (Tag, createTag, getTag, logRecord)
import Control.Monad.IO.Class
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
      -- currently not implemented
      -- IP Address is not available at the application level
      -- need to add lower level middleware (TCP/IP - socket info)
      -- maybe_ip_addr <- header "blah"
      -- let ip_addr = case maybe_ip_addr of Nothing -> ""
      --                                     Just s -> s
      let ip_addr = "N/A"
      u_tag <- liftIO $ logRecord (getTag t_id) ip_addr
      json (u_tag)

    get "/api/tag/" $ do
      return ()
