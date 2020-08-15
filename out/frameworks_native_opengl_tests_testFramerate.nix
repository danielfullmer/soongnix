{ android_app }:
let

# ########################################################################
#  Test framerate and look for hiccups
# ########################################################################

TestFramerate = android_app {
    name = "TestFramerate";
    srcs = [
        "src/com/android/testframerate/TestFramerateActivity.java"
        "src/com/android/testframerate/TestFramerateView.java"
    ];
    sdk_version = "system_current";
};

in { inherit TestFramerate; }
