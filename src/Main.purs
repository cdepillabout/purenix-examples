
module Main where

import Prelude

import Nix.Types (FunctionWithArgs, mkFunctionWithArgs)

-- | { fetchurl, stdenv }:
-- |
-- | stdenv.mkDerivation rec {
-- |   pname = "hello";
-- |   version = "2.10";
-- |
-- |   src = fetchurl {
-- |     url = "mirror://gnu/hello/hello-2.10.tar.gz";
-- |     sha256 = "0ssi1wpaf7plaswqqjwigppsg5fyh99vdlb9kzl7c9lng89ndq1i";
-- |   };
-- |
-- |   doCheck = true;
-- | }
helloDerivation :: FunctionWithArgs
helloDerivation =
  mkFunctionWithArgs
    ["fetchurl", "stdenv"]
    (\args ->
      (args !. "stdenv" !. "mkDerivation")
        { pname: "hello"
        , version: "2.10"
        , src: (args !. "fetchurl")
        }
    )
