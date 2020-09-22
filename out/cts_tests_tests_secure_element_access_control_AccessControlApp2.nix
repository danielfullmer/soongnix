{ android_test_helper_app, android_test_import }:
let

# ////////////////////////////////////////////////////////////////
#  Signed Package

signed-CtsSecureElementAccessControlTestCases2 = android_test_import {
    name = "signed-CtsSecureElementAccessControlTestCases2";
    apk = "apk/signed-CtsSecureElementAccessControlTestCases2.apk";

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
        "cts-instant"
    ];
    #  Make sure the build system doesn't try to resign the APK
    presigned = true;
    dex_preopt = {
        enabled = false;
    };
};

# #################################################################
#  Unsigned Package

CtsSecureElementAccessControlTestCases2 = android_test_helper_app {
    name = "CtsSecureElementAccessControlTestCases2";
    defaults = ["cts_defaults"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    srcs = ["src/android/omapi/accesscontrol2/cts/AccessControlTest.java"];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    dist = {
        targets = ["cts"];
    };
};

in { inherit CtsSecureElementAccessControlTestCases2 signed-CtsSecureElementAccessControlTestCases2; }
