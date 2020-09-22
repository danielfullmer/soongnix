{ android_test }:
let

# ############################################################
#  Car Dialer unit test target.                              #
# ############################################################
CarDialerUnitTests = android_test {
    name = "CarDialerUnitTests";

    srcs = ["src/com/android/car/dialer/livedata/CallStateLiveDataUnitTest.java"];

    java_resource_dirs = ["config"];

    static_libs = [
        "androidx.test.ext.junit"
    ];

    instrumentation_for = "CarDialerAppForTesting";
};

in { inherit CarDialerUnitTests; }
