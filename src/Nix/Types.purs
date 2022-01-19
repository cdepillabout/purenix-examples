
module Nix.Types where

-- | This datatype represents a Nix function that takes an attribute set.
-- |
-- | For instance, imagine the following Nix function:
-- |
-- | ```nix
-- | { a, b }: a + b
-- | ```
-- |
-- | This Nix function could be constructed from PureScript with `mkFunctionWithArgs`:
-- |
-- | ```purescript
-- | mkFunctionWithArgs ["a", "b"] (\args -> (args !. "a") + (args !. "b"))
-- | ```
foreign import data FunctionWithArgs :: Type

-- |  See the docs on `FunctionWithArgs`.
foreign import mkFunctionWithArgs
  :: forall a. Array String -> (AttrSet -> a) -> FunctionWithArgs

