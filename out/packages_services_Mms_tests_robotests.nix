{ android_robolectric_test }:
let

# ############################################################
#  MmsService Robolectric test target.                       #
# ############################################################

MmsServiceRoboTests = android_robolectric_test {
    name = "MmsServiceRoboTests";

    srcs = [
        "src/com/android/mms/service/ApnSettingsTest.java"
        "src/com/android/mms/service/MmsServiceRoboTest.java"
    ];

    java_resource_dirs = ["config"];

    static_libs = [
        "androidx.test.core"
        "testng"
    ];

    instrumentation_for = "MmsService";
};

in { inherit MmsServiceRoboTests; }
