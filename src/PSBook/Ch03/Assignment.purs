module Ch03.Assignment where

import Ch03.AddressBook (AddressBook, Entry, Address, insertEntry, emptyBook, showEntry)
import Data.List (filter, head, null, nubBy)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (logShow)
import Prelude ((==), (&&), (<<<), (<$>), ($), Unit, discard)

{-
Test your understanding of the findEntry function by
writing down the types of each of its major subexpressions
-}

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName = head' <<< filter' filterEntry
  where
    filterEntry :: Entry -> Boolean
    filterEntry entry = entry.firstName == firstName && entry.lastName == lastName
    filter' :: (Entry -> Boolean) -> AddressBook -> AddressBook
    filter' filterFunc book = filter filterFunc book
    head' :: AddressBook -> Maybe Entry
    head' book = head book

{-
Write a function which looks up an Entry given a street address,
by reusing the existing code in findEntry
-}

findEntryByAddress :: Address -> AddressBook -> Maybe Entry
findEntryByAddress address = head <<< filter filterEntry
  where
    filterEntry :: Entry -> Boolean
    filterEntry entry = entry.address.street == address.street
                    &&  entry.address.city == address.city
                    &&  entry.address.state == address.state

{-
Write a function which tests whether a name appears in a AddressBook, returning a Boolean value.
-}

checkAppearance :: String -> String -> AddressBook -> Boolean
checkAppearance firstName lastName book =
  if null book
  then false
  else
    let findResults = findEntry firstName lastName book
    in case findResults of
        Just a -> true
        Nothing -> false

{-
Write a function removeDuplicates which removes duplicate address book entries with the same first and last names
-}

removeDuplicates :: AddressBook -> AddressBook
removeDuplicates book = nubBy equalityCheck book
  where
    equalityCheck :: Entry -> Entry -> Boolean
    equalityCheck a b = a.firstName == b.firstName
                      && a.lastName == b.lastName

-- Examples

entry1 :: Entry
entry1 =
  { firstName: "John"
  , lastName: "Smith"
  , address: { street: "123 Fake St."
             , city: "Faketown"
             , state: "CA"
             }
  }

entry2 :: Entry
entry2 =
  { firstName: "Phil"
  , lastName: "Freeman"
  , address: { street: "321 Random St."
             , city: "RandomTown"
             , state: "LA"
             }
  }
testAddress :: Address
testAddress = { street: "123 Fake St.", city: "Faketown", state: "CA" }

addressBook1 :: AddressBook
addressBook1 = insertEntry entry1 emptyBook

addressBook2 :: AddressBook
addressBook2 = insertEntry entry1 $ insertEntry entry2 addressBook1

runAssignment :: Effect Unit
runAssignment = do
    logShow $ showEntry <$> findEntryByAddress testAddress addressBook1
    logShow $ showEntry <$> findEntry "John" "Smith" addressBook1
    logShow $ checkAppearance "John" "Smith" addressBook1
    logShow $ checkAppearance "Phil" "Smith" addressBook1
    logShow $ removeDuplicates addressBook2