{ java_binary }:
let

#  Copyright 2015 The Android Open Source Project
#

sm = java_binary {
    name = "sm";
    wrapper = "sm";
    srcs = ["src/com/android/commands/sm/Sm.java"];
};

in { inherit sm; }
