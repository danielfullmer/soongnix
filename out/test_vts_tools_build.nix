{ cc_defaults }:
let

#  Common build rules for VTS tests

#  VTS target-side test binaries must use the following for proper packaging:
vts_target_tests_defaults = cc_defaults {
    name = "vts_target_tests_defaults";
    #  TODO(b/120486052): Temporalily removed due to a unit test.
    #  test_suites: ["general-tests"],
};

in { inherit vts_target_tests_defaults; }
