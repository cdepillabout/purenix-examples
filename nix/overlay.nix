
final: prev:

let Main = import ../output/Main;
in

{
  helloExample = final.callPackage Main.helloDerivation {};
}
