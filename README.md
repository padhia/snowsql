# snowsql Nix Flake

This flake now contains, usually, a more up-to-date version of `snowsql`.

Historically, the flake provided a patched version of `snowsql` that fixed [this issue](https://github.com/NixOS/nixpkgs/issues/199622). Starting with snowsql version [1.2.30](https://docs.snowflake.com/en/release-notes/clients-drivers/snowsql-2023#version-1-2-30-november-13-2023),  the underlying Snowflake Python connector no longer depends on `oscrypto`, which was needed to be patched.
