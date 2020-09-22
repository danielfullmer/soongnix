{ java_binary }:
let

#  Copyright 2017 The Android Open Source Project
#

vr = java_binary {
    name = "vr";
    wrapper = "vr";
    srcs = ["src/com/android/commands/vr/Vr.java"];
};

in { inherit vr; }
