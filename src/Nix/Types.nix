{
  # TODO: Write comment here.
  # :: forall a. Array String -> (AttrSet -> a) -> FunctionWithArgs
  mkFunctionWithArgs = argList: f:
    { __functor = _: f;
      __functionArgs = builtins.listToAttrs (map (k: { name = k; value = false; }) argList);
    };
}
