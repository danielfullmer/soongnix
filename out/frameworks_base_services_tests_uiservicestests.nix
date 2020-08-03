{ android_test }:
let

# ########################################################################
#  Build FrameworksUiServicesTests package
# ########################################################################

FrameworksUiServicesTests = android_test {
    name = "FrameworksUiServicesTests";

    #  Include test java files
    srcs = [
        "src/**/*.java"
    ];

    static_libs = [
        "services.accessibility"
        "services.core"
        "services.devicepolicy"
        "services.net"
        "services.usage"
        "guava"
        "androidx.test.rules"
        "hamcrest-library"
        "mockito-target-inline-minus-junit4"
        "platform-test-annotations"
        "platformprotosnano"
        "hamcrest-library"
        "testables"
        "truth-prebuilt"
    ];

    libs = [
        "android.test.runner"
        "android.test.base"
    ];

    dxflags = ["--multi-dex"];

    platform_apis = true;
    test_suites = ["device-tests"];

    certificate = "platform";

    compile_multilib = "both";

    #  These are not normally accessible from apps so they must be explicitly included.
    jni_libs = [
        "libdexmakerjvmtiagent"
        "libmultiplejvmtiagentsinterferenceagent"
        "libbacktrace"
        "libbase"
        "libbinder"
        "libbinderthreadstate"
        "libc++"
        "libcutils"
        "liblog"
        "liblzma"
        "libnativehelper"
        "libui"
        "libunwindstack"
        "libutils"
        "netd_aidl_interface-V2-cpp"
    ];
};

in { inherit FrameworksUiServicesTests; }
