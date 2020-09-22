{ android_robolectric_test }:
let

# ###############################################
#  CarRotaryController Robolectric test target. #
# ###############################################
CarRotaryControllerRoboTests = android_robolectric_test {
    name = "CarRotaryControllerRoboTests";

    srcs = [
        "src/com/android/car/rotary/FocusFinderTest.java"
        "src/com/android/car/rotary/NavigatorTest.java"
        "src/com/android/car/rotary/NodeBuilder.java"
        "src/com/android/car/rotary/NodeBuilderTest.java"
        "src/com/android/car/rotary/RotaryCacheTest.java"
        "src/com/android/car/rotary/TreeTraverserTest.java"
        "src/com/android/car/rotary/WindowBuilder.java"
        "src/com/android/car/rotary/WindowBuilderTest.java"
    ];

    java_resource_dirs = ["config"];

    #  Include the testing libraries
    libs = [
        "android.car"
    ];
    static_libs = [
        "car-ui-lib"
    ];

    instrumentation_for = "CarRotaryController";
};

in { inherit CarRotaryControllerRoboTests; }
