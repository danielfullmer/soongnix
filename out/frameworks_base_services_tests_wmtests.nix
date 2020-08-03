{ android_test }:
let

# ########################################################################
#  Build WmTests package
# ########################################################################

WmTests = android_test {
    name = "WmTests";

    #  We only want this apk build for tests.

    #  Include all test java files.
    srcs = [
        "src/**/*.java"
    ];

    static_libs = [
        "frameworks-base-testutils"
        "services.core"
        "androidx.test.runner"
        "androidx.test.rules"
        "mockito-target-extended-minus-junit4"
        "platform-test-annotations"
        "servicestests-utils"
        "truth-prebuilt"
        "testables"
        "ub-uiautomator"
        "hamcrest-library"
    ];

    libs = [
        "android.test.mock"
        "android.test.base"
        "android.test.runner"
    ];

    #  These are not normally accessible from apps so they must be explicitly included.
    jni_libs = [
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];

    platform_apis = true;
    test_suites = ["device-tests"];

    certificate = "platform";

    dxflags = ["--multi-dex"];

    optimize = {
        enabled = false;
    };

};

in { inherit WmTests; }
