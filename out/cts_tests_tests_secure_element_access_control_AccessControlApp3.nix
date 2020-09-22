{ android_test_helper_app, android_test_import }:
let

# ////////////////////////////////////////////////////////////////
#  Signed Package

signed-CtsSecureElementAccessControlTestCases3 = android_test_import {
    name = "signed-CtsSecureElementAccessControlTestCases3";
    apk = "apk/signed-CtsSecureElementAccessControlTestCases3.apk";

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

CtsSecureElementAccessControlTestCases3 = android_test_helper_app {
    name = "CtsSecureElementAccessControlTestCases3";
    defaults = ["cts_defaults"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    srcs = ["src/android/omapi/accesscontrol3/cts/AccessControlTest.java"];
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

in { inherit CtsSecureElementAccessControlTestCases3 signed-CtsSecureElementAccessControlTestCases3; }
