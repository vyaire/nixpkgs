# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, ansiTerminal, async, deepseq, ghcPaths, hspecExpectations
, hspecMeta, HUnit, QuickCheck, quickcheckIo, random, setenv
, silently, tfRandom, time, transformers
}:

cabal.mkDerivation (self: {
  pname = "hspec-core";
  version = "2.0.2";
  sha256 = "19nssrvwnpa9yib9qqrhf1hi8m624si97874hhdh2hqc7kjqr332";
  buildDepends = [
    ansiTerminal async deepseq hspecExpectations HUnit QuickCheck
    quickcheckIo random setenv tfRandom time transformers
  ];
  testDepends = [
    ansiTerminal async deepseq ghcPaths hspecExpectations hspecMeta
    HUnit QuickCheck quickcheckIo random setenv silently tfRandom time
    transformers
  ];
  meta = {
    homepage = "http://hspec.github.io/";
    description = "A Testing Framework for Haskell";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
