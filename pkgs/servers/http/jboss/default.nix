{ stdenv, fetchurl, unzip, jdk, lib }:

stdenv.mkDerivation {
  name = "jboss-as-7.1.1.Final";
  src = fetchurl {
    url = http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz;
    sha256 = "1bdjw0ib9qr498vpfbg8klqw6rl11vbz7vwn6gp1r5gpqkd3zzc8";
  };

  buildInputs = [ unzip ];

  phases = [ "unpackPhase" "installPhase" "fixupPhase" ];
  
  installPhase = ''
    mv $PWD $out
    find $out/bin -name \*.sh -print0 | xargs -0 sed -i -e '/#!\/bin\/sh/aJAVA_HOME=${jdk}'
  '';
  
  meta = {
    homepage = "http://www.jboss.org/";
    description = "Open Source J2EE application server";
    license = "GPL/LGPL";
    maintainers = [ lib.maintainers.sander ];
  };
}
