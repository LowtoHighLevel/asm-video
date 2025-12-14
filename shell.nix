let
  pkgs = import <nixpkgs> { };
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    git
    zig
    lazygit
    gnumake
  ];
}
