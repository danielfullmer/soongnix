{ java_binary }:
let

#  Copyright 2007 The Android Open Source Project
#

bmgr = java_binary {
    name = "bmgr";
    wrapper = "bmgr";
    srcs = ["src/com/android/commands/bmgr/Bmgr.java"];
};

in { inherit bmgr; }
