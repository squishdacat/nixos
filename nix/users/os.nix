{ config, lib, ... }:
let
  # Will turn the following list
  #  [ "foo:5" "bar:7" ]
  # into the following attr
  #  { foo = 5; bar = 7; }
  users = lib.fold (
    a: b:
    b
    // {
      ${lib.elemAt (lib.splitString ":" a) 0} = lib.elemAt (lib.splitString ":" a) 1;
    }
    # FIXME: For some reason using `config.myNix.users` causes an "infinet recursion"?
  ) { } [ "coolgi:0" ];
in
{
  imports = map (x: ./${x}/os.nix) (builtins.attrNames users);
}
