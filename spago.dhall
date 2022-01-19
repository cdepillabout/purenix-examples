{ name = "purenix-examples"
, dependencies =
    [ "control"
    , "foldable-traversable"
    , "maybe"
    , "prelude"
    , "tuples"
    , "unsafe-coerce"
    ]
, backend = "purenix"
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
