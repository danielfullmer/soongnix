{ android_test, filegroup, java_library }:
let

# ########################################################################
#  Build FrameworksServicesTests package
# ########################################################################

FrameworksServicesTests = android_test {
    name = "FrameworksServicesTests";

    #  Include all test java files.
    srcs = [
        "src/**/*.java"

        "aidl/com/android/servicestests/aidl/INetworkStateObserver.aidl"
        "aidl/com/android/servicestests/aidl/ICmdReceiverService.aidl"

        "test-apps/JobTestApp/src/**/*.java"

        "test-apps/SuspendTestApp/src/**/*.java"
    ];
    static_libs = [
        "frameworks-base-testutils"
        "services.accessibility"
        "services.appwidget"
        "services.autofill"
        "services.backup"
        "services.contentsuggestions"
        "services.core"
        "services.devicepolicy"
        "services.net"
        "services.usage"
        "guava"
        "androidx.test.core"
        "androidx.test.runner"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "platform-test-annotations"
        "ShortcutManagerTestUtils"
        "truth-prebuilt"
        "testables"
        "testng"
        "ub-uiautomator"
        "platformprotosnano"
        "hamcrest-library"
        "servicestests-utils"
    ];

    aidl = {
        local_include_dirs = ["aidl"];
    };

    libs = [
        "android.hidl.manager-V1.0-java"
        "android.hardware.tv.cec-V1.0-java"
        "android.test.mock"
        "android.test.base"
        "android.test.runner"
    ];

    platform_apis = true;
    test_suites = ["device-tests"];

    certificate = "platform";

    #  These are not normally accessible from apps so they must be explicitly included.
    jni_libs = [
        "libbacktrace"
        "libbase"
        "libbinder"
        "libbinderthreadstate"
        "libc++"
        "libcutils"
        "liblog"
        "liblzma"
        "libnativehelper"
        "libpsi"
        "libui"
        "libunwindstack"
        "libutils"
        "netd_aidl_interface-V2-cpp"
    ];

    dxflags = ["--multi-dex"];

    optimize = {
        enabled = false;
    };
};

servicestests-utils = java_library {
    name = "servicestests-utils";
    srcs = [
        "utils/**/*.java"
    ];
    static_libs = [
        "junit"
        "mockito-target-minus-junit4"
    ];
    libs = [
        "android.test.runner"
    ];
};

servicestests-SuspendTestApp-files = filegroup {
    name = "servicestests-SuspendTestApp-files";
    srcs = [
        "src/com/android/server/pm/SuspendPackagesTest.java"
    ];
};

in { inherit FrameworksServicesTests servicestests-SuspendTestApp-files servicestests-utils; }
