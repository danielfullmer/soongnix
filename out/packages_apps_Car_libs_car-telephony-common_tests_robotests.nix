{ android_app, android_robolectric_test }:
let

# ###########################################################
#  car-telephony-common just for Robolectric test target.   #
# ###########################################################
CarTelephonyCommonForTesting = android_app {
    name = "CarTelephonyCommonForTesting";

    platform_apis = true;

    libs = ["android.car"];

    privileged = true;

    static_libs = ["car-telephony-common"];
};

# ############################################################
#  car-telephony-common Robolectric test target.             #
# ############################################################
CarTelephonyCommonRoboTests = android_robolectric_test {
    name = "CarTelephonyCommonRoboTests";

    srcs = ["src/com/android/car/telephony/common/ContactTest.java"];

    java_resource_dirs = ["config"];

    instrumentation_for = "CarTelephonyCommonForTesting";
};

in { inherit CarTelephonyCommonForTesting CarTelephonyCommonRoboTests; }
