{-# LANGUAGE DeriveGeneric #-}

module Lib
(
  Tag
, createTag
, getTag
, logRecord
) where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics


data Timestamp = Timestamp {
  timestamp :: String
, ip_address :: String
} deriving (Show, Generic)

instance ToJSON Timestamp
instance FromJSON Timestamp

createTimestamp :: String -> String -> Timestamp
createTimestamp ts ip = Timestamp ts ip

data Tag = Tag {
  _id :: String
, access_log :: [Timestamp]
} deriving (Show, Generic)

instance ToJSON Tag
instance FromJSON Tag

createTag :: Tag
createTag = Tag "_id-adsadsf" []

getTag :: String -> Tag
getTag t_id = Tag t_id []

logRecord :: Tag -> Tag
logRecord (Tag {_id = t_id, access_log = ts}) = Tag t_id (t:ts)
  where t = createTimestamp "now" "ip addr"
