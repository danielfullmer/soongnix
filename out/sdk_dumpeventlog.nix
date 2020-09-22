{ java_binary_host }:
let

#  Copyright 2007 The Android Open Source Project
#

dumpeventlog = java_binary_host {
    name = "dumpeventlog";

    srcs = ["src/com/android/dumpeventlog/DumpEventLog.java"];

    wrapper = "etc/dumpeventlog";
    main_class = "com.android.dumpeventlog.DumpEventLog";
    libs = ["ddmlib-prebuilt"];
};

in { inherit dumpeventlog; }
