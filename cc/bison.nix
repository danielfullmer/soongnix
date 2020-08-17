{ stdenv, lib, fetchurl, m4, perl, fetchpatch }:

stdenv.mkDerivation rec {
  name = "bison-2.7.1";

  src = fetchurl {
    url = "mirror://gnu/bison/${name}.tar.gz";
    sha256 = "0c9li3iaslzzr3zig6m3zlmb4r8i0wfvkcrvdyiqxasb09mjkqh8";
  };

  patches = [ (fetchpatch {
    url = "https://raw.githubusercontent.com/rdslw/openwrt/e5d47f32131849a69a9267de51a30d6be1f0d0ac/tools/bison/patches/110-glibc-change-work-around.patch";
    sha256 = "17k5hzqk1k5xaqdrycbljb3gj1hdaq8b3wq42ji0msg1789hf1ws";
  }) ];

  nativeBuildInputs = [ m4 perl ];
  propagatedBuildInputs = [ m4 ];
  #checkInputs = [ perl ];

  #doCheck = true;
  # M4 = "${m4}/bin/m4";

  meta = {
    homepage = https://www.gnu.org/software/bison/;
    description = "Yacc-compatible parser generator";
    license = stdenv.lib.licenses.gpl3Plus;

    longDescription = ''
      Bison is a general-purpose parser generator that converts an
      annotated context-free grammar into an LALR(1) or GLR parser for
      that grammar.  Once you are proficient with Bison, you can use
      it to develop a wide range of language parsers, from those used
      in simple desk calculators to complex programming languages.
      Bison is upward compatible with Yacc: all properly-written Yacc
      grammars ought to work with Bison with no change.  Anyone
      familiar with Yacc should be able to use Bison with little
      trouble.  You need to be fluent in C or C++ programming in order
      to use Bison.
    '';

    platforms = stdenv.lib.platforms.unix;
  };

  passthru = { glrSupport = true; };
}
