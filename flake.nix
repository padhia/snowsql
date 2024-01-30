{
  description = "Snowflake snowsql command-line SQL utility";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    snowflake.url = "github:padhia/snowflake";
    snowflake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, snowflake }: {
    apps.x86_64-linux.default = snowflake.apps.x86_64-linux.snowsql;
  };
}
