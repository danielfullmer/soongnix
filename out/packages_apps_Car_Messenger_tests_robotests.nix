{ android_robolectric_test }:
let

# ############################################################
#  Car Messenger Robolectric test target.                    #
# ############################################################

CarMessengerRoboTests = android_robolectric_test {
    name = "CarMessengerRoboTests";

    srcs = [
        "src/com/android/car/messenger/MessengerDelegateTest.java"
        "src/com/android/car/messenger/bluetooth/BluetoothHelperTest.java"
        "src/com/android/car/messenger/bluetooth/BluetoothMonitorTest.java"
        "src/com/android/car/messenger/testutils/ShadowBluetoothAdapter.java"
    ];

    java_resource_dirs = ["config"];

    #  Include the testing libraries
    libs = [
        "testng"
    ];

    instrumentation_for = "CarMessengerApp";
};

in { inherit CarMessengerRoboTests; }
