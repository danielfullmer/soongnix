{ lib, cc }:

with lib;
{
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
