{ java_binary }:
let

#  Copyright 2014 The Android Open Source Project
#

dpm = java_binary {
    name = "dpm";
    wrapper = "dpm";
    srcs = ["src/com/android/commands/dpm/Dpm.java"];
};

in { inherit dpm; }
