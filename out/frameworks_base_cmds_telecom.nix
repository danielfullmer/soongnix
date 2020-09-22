{ java_binary }:
let

#  Copyright 2015 The Android Open Source Project
#

telecom = java_binary {
    name = "telecom";
    wrapper = "telecom";
    srcs = ["src/com/android/commands/telecom/Telecom.java"];
};

in { inherit telecom; }
