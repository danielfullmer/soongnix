{ java_binary_host }:
let

#  Copyright 2006 The Android Open Source Project
#

BugReport = java_binary_host {
    name = "BugReport";
    wrapper = "bugreport";
    manifest = "manifest-library.mf";
    srcs = ["src/**/*.java"];
    java_resource_dirs = ["resources"];
    static_libs = ["jsilver"];
};

in { inherit BugReport; }
