{-# LANGUAGE DeriveGeneric #-}

module Lib
(
  Tag
, createTag
, getTag
, logRecord
) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Text.Lazy
import Data.Time.Clock (UTCTime, getCurrentTime)
import GHC.Generics

data Timestamp = Timestamp {
  timestamp :: UTCTime
, ip_address :: Text
} deriving (Show, Generic)

instance ToJSON Timestamp
instance FromJSON Timestamp

createTimestamp :: UTCTime -> Text -> Timestamp
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

logRecord :: Tag -> Text -> IO Tag
logRecord (Tag {_id = t_id, access_log = ts}) ip_addr = do
  now <- getCurrentTime
  let t = createTimestamp now ip_addr
  return $ Tag t_id (t:ts)
