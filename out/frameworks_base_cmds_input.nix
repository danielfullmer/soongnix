{ java_binary }:
let

#  Copyright 2008 The Android Open Source Project
#

input = java_binary {
    name = "input";
    wrapper = "input";
    srcs = ["src/com/android/commands/input/Input.java"];
};

in { inherit input; }
