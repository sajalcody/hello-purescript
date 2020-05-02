module Ch03.Test where

import Prelude

import Ch03.AddressBook (AddressBook, Entry, emptyBook, insertEntry, findEntry, showEntry)
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Console (logShow)

example :: Entry
example =
  { firstName: "John"
  , lastName: "Smith"
  , address: { street: "123 Fake St."
             , city: "Faketown"
             , state: "CA"
             }
  }

book0 :: AddressBook
book0 = emptyBook

printEntry :: String -> String -> AddressBook -> Maybe String
printEntry firstName lastName book = showEntry <$> findEntry firstName lastName book

mainCh03 :: Effect Unit
mainCh03 = do
  let book1 = insertEntry example emptyBook

  logShow $ printEntry "John" "Smith" book0
  logShow $ printEntry "John" "Smith" book1
