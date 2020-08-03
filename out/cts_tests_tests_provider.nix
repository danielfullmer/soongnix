{ android_test }:
let

CtsProviderTestCases = android_test {
    name = "CtsProviderTestCases";
    defaults = ["cts_defaults"];

    compile_multilib = "both";

    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];

    libs = [
        "android.test.mock"
        "android.test.base.stubs"
        "android.test.runner.stubs"
        "telephony-common"
    ];

    static_libs = [
        "androidx.slice_slice-core"
        "androidx.slice_slice-view"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "junit"
        "truth-prebuilt"
        "mockito-target-minus-junit4"
    ];

    jni_libs = [
        "libcts_jni"
        "libnativehelper_compat_libc++"
    ];

    srcs = ["src/**/*.java"];

    sdk_version = "test_current";
    min_sdk_version = "21";
};

in { inherit CtsProviderTestCases; }
