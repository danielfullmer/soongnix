{ java_binary }:
let

#  Copyright 2011 The Android Open Source Project
#

bu = java_binary {
    name = "bu";
    wrapper = "bu";
    srcs = ["src/com/android/commands/bu/Backup.java"];
};

in { inherit bu; }
