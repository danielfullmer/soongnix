{ java_binary }:
let

#  Copyright 2015 The Android Open Source Project
#

hid = java_binary {
    name = "hid";
    wrapper = "hid";
    srcs = [
        "src/com/android/commands/hid/Device.java"
        "src/com/android/commands/hid/Event.java"
        "src/com/android/commands/hid/Hid.java"
    ];
    required = ["libhidcommand_jni"];
};

in { inherit hid; }
