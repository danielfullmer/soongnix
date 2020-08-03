{ java_binary }:
let

#  Copyright 2007 The Android Open Source Project
#

bmgr = java_binary {
    name = "bmgr";
    wrapper = "bmgr";
    srcs = ["**/*.java"];
};

in { inherit bmgr; }
