{ android_test }:
let

# ############################################################
#  Car Dialer Instrumented test target.                       #
# ############################################################
CarDialerInstruTests = android_test {
    name = "CarDialerInstruTests";

    srcs = [];

    test_suites = ["device-tests"];

    static_libs = [
        "androidx.test.ext.junit"
    ];

    instrumentation_for = "CarDialerAppForTesting";
};

in { inherit CarDialerInstruTests; }
