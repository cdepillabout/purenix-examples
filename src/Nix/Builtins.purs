
module Nix.Builtins where

import Nix.Types (AttrSet)

foreign import getAttr :: forall a. String -> AttrSet -> a

-- | A flipped version of `getAttr`.
getAttrFlip :: forall a. AttrSet -> String -> a
getAttrFlip attrSet key = getAttr key attrSet
infixl 9 getAttrFlip as !.
