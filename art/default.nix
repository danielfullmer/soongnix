{ lib, cc }:

with lib;
{
  #art_cc_library = args: cc.cc_library (recursiveMerge [
  #  args
  #  { # See art/build/art.go
  #    cflags = [
  #      "-O3"
  #      "-DART_DEFAULT_GC_TYPE=CMS"
  #      "-DIMT_SIZE=43"
  #      "-DART_USE_GENERATIONAL_CC=1"
  #      "-DART_DEFAULT_COMPACT_DEX_LEVEL=fast"
  #      "-DART_STACK_OVERFLOW_GAP_arm=8192"
  #      "-DART_STACK_OVERFLOW_GAP_arm64=8192"
  #      "-DART_STACK_OVERFLOW_GAP_mips=16384"
  #      "-DART_STACK_OVERFLOW_GAP_mips64=16384"
  #      "-DART_STACK_OVERFLOW_GAP_x86=8192"
  #      "-DART_STACK_OVERFLOW_GAP_x86_64=8192"
  #      "-DUSE_D8_DESUGAR=1"

  #      # host flags
  #      "-Wframe-larger-than=1736"
  #      "-DART_FRAME_SIZE_LIMIT=6400"
  #    ];
  #  }
  #]);
  art_cc_library = cc.cc_library;

  art_cc_library_static = cc.cc_library_static;
  art_cc_binary = cc.cc_binary;
  art_cc_test = cc.cc_test;
  art_cc_test_library = cc.cc_test_library;
  art_cc_defaults = cc.cc_defaults;
  libart_cc_defaults = cc.cc_defaults;
  libart_static_cc_defaults = cc.cc_defaults;
  art_global_defaults = cc.cc_defaults;
  art_debug_defaults = cc.cc_defaults;
  art_apex_test = id;
}
