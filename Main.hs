{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Digest.Adler32
import Data.String
import qualified Data.ByteString.Lazy as BS

main :: IO ()
main = print (adler32 ("it works!" :: BS.ByteString))
