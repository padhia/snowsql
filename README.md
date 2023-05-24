# snowsql flake

**tl;dr**: This is a patched version of `snowsql` (Snowflake's default CLI runner) that is available in [`nixpkgs`]((https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/applications/misc/snowsql/default.nix))

`snowsql` binary, [presumably](https://docs.snowflake.com/en/user-guide/snowsql), embeds a Python interpreter and the required Python libraries. One of the embedded libraries, `oscrypto` has the default implementation that relies on `objdump` command at run-time to resolve certain platform-specific native libraries.

`nixpkgs` solved this problem [more elegantly](https://github.com/NixOS/nixpkgs/pull/183099#discussion_r937828109) by patching the `oscrypto` library.

Since source patching isn't possible with the binary-only `snowsql`, this flake uses a modified `snowsql` derivation to add `binutils` as a dependency (includes the needed `objdump` command). This allows the embedded `oscrypto` library's default implementation to rely on `objdump` to find platform-specific native libraries.
