{ mkDerivation, base, hakyll, stdenv, time }:
mkDerivation {
  pname = "site-generator";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base hakyll time ];
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
