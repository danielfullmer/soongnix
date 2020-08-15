{ android_test }:
let

FrameworksLocationTests = android_test {
    name = "FrameworksLocationTests";
    #  Include all test java files.
    srcs = [
        "src/android/location/CountryTester.java"
        "src/android/location/GeocoderTest.java"
        "src/android/location/GnssStatusTest.java"
        "src/android/location/LocationManagerTest.java"
        "src/android/location/LocationTest.java"
        "src/android/location/SatelliteInfo.java"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    platform_apis = true;
    static_libs = [
        "androidx.test.rules"
        "core-test-rules"
        "guava"
        "mockito-target-minus-junit4"
        "frameworks-base-testutils"
        "truth-prebuilt"
    ];
    test_suites = ["device-tests"];
};

in { inherit FrameworksLocationTests; }
