{ android_test, java_defaults }:
let

# ########################################################################
#  Build FrameworksNetTests package
# ########################################################################
FrameworksNetTests-jni-defaults = java_defaults {
    name = "FrameworksNetTests-jni-defaults";
    static_libs = [
        "FrameworksNetCommonTests"
        "frameworks-base-testutils"
        "frameworks-net-testutils"
        "framework-protos"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "platform-test-annotations"
        "services.core"
        "services.net"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    jni_libs = [
        "ld-android"
        "libartbase"
        "libbacktrace"
        "libbase"
        "libbinder"
        "libbinderthreadstate"
        "libbpf"
        "libbpf_android"
        "libc++"
        "libcgrouprc"
        "libcrypto"
        "libcutils"
        "libdexfile"
        "libdl_android"
        "libhidl-gen-utils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libjsoncpp"
        "liblog"
        "liblzma"
        "libnativehelper"
        "libnetdbpf"
        "libnetdutils"
        "libpackagelistparser"
        "libpcre2"
        "libprocessgroup"
        "libselinux"
        "libui"
        "libutils"
        "libvndksupport"
        "libtinyxml2"
        "libunwindstack"
        "libutilscallstack"
        "libziparchive"
        "libz"
        "netd_aidl_interface-V2-cpp"
        "libnetworkstatsfactorytestjni"
    ];
};

FrameworksNetTests = android_test {
    name = "FrameworksNetTests";
    defaults = ["FrameworksNetTests-jni-defaults"];
    srcs = [
        "java/**/*.java"
        "java/**/*.kt"
    ];
    platform_apis = true;
    test_suites = ["device-tests"];
    certificate = "platform";
};

in { inherit FrameworksNetTests FrameworksNetTests-jni-defaults; }
