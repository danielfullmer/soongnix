{ android_app }:
let

# ########################################################################
#  Test framerate and look for hiccups
# ########################################################################

TestFramerate = android_app {
    name = "TestFramerate";
    srcs = ["**/*.java"];
    sdk_version = "system_current";
};

in { inherit TestFramerate; }
