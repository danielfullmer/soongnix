{ java_test_host }:
let

#  Copyright 2011 The Android Open Source Project

dx-tests = java_test_host {
    name = "dx-tests";
    srcs = ["**/*.java"];
    libs = [
        "dx"
        "junit-host"
    ];
};

in { inherit dx-tests; }
