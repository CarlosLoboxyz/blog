{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  ssg6 = stdenv.mkDerivation {
    name = "ssg6";
    src = fetchurl {
      url = "https://rgz.ee/bin/ssg6";
      sha256 = "09kpqfz5kl2jwm6b9p7qbdz55197xka5qahxhhsycb4bcvkq1459";
    };
    phases = [ "installPhase" "patchPhase" ];
    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/ssg6
      chmod +x $out/bin/ssg6
    '';
  };
in

mkShell {
  buildInputs = [
    lowdown
    ssg6
  ];
}
