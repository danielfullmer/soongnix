{ cc_test }:
let

#  This example client is written as a test, but it is executing from a system
#  context. All this code would look the same if it was running in system
#  server for example.

"android.hardware.tests.extension.vibrator-client" = cc_test {
    name = "android.hardware.tests.extension.vibrator-client";
    srcs = [
        #  system code has the option to use the unstable C++ libbinder API
        #  or the NDK one. For maximum code portability, using the ndk client
        #  makes the most sense, but both are provided here as an example.
        "test-cpp-client.cpp"
        "test-ndk-client.cpp"
    ];
    shared_libs = [
        "libbinder"
        "libutils"
        "android.hardware.vibrator-cpp"
        "android.hardware.tests.extension.vibrator-cpp"

        "libbinder_ndk"
        "android.hardware.vibrator-ndk_platform"
        "android.hardware.tests.extension.vibrator-ndk_platform"
    ];
};

in { inherit "android.hardware.tests.extension.vibrator-client"; }
