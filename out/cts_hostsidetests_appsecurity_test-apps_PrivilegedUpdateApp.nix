{ android_test_helper_app }:
let

# ##########################################################
#  Package w/ tests

CtsPrivilegedUpdateTests = android_test_helper_app {
    name = "CtsPrivilegedUpdateTests";
    defaults = ["cts_support_defaults"];
    sdk_version = "test_current";
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
    ];
    libs = ["android.test.base.stubs"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
    srcs = [
        "src/com/android/cts/privilegedupdate/PrivilegedAppDisableTest.java"
        "src/com/android/cts/privilegedupdate/PrivilegedUpdateTest.java"
    ];
};

in { inherit CtsPrivilegedUpdateTests; }
