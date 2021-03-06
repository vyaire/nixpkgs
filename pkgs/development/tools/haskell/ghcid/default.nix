# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, cmdargs, extra, filepath, tasty, tastyHunit, terminalSize
, time
}:

cabal.mkDerivation (self: {
  pname = "ghcid";
  version = "0.3.2";
  sha256 = "1kx20la4snldhd709y69za8bs57v90nblghfrxrvmzhrmpvh4bn3";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ cmdargs extra filepath terminalSize time ];
  testDepends = [
    cmdargs extra filepath tasty tastyHunit terminalSize time
  ];
  doCheck = false;
  meta = {
    homepage = "https://github.com/ndmitchell/ghcid#readme";
    description = "GHCi based bare bones IDE";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
