{ android_test }:
let

SmokeTest = android_test {
    name = "SmokeTest";
    #  Include all test java files.
    srcs = [
        "src/com/android/smoketest/ProcessErrorsTest.java"
        "src/com/android/smoketest/SmokeTestRunner.java"
    ];
    #  Notice that we don't have to include the src files of SmokeTestApp because, by
    #  running the tests using an instrumentation targeting SmokeTestApp, we
    #  automatically get all of its classes loaded into our environment.
    instrumentation_for = "SmokeTestApp";
    sdk_version = "8";
};

in { inherit SmokeTest; }
