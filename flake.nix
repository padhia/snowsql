{
  description = "snowsql with binutils in the path";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs}:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config = { allowUnfree = true; };
    };

    snowsql = pkgs.callPackage ./snowsql.nix {};

  in {
    apps.x86_64-linux.default = {
      type = "app";
      program = "${snowsql}/bin/snowsql";
    };
    packages.x86_64-linux.default = snowsql;
  };
}
