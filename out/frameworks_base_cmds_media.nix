{ java_binary }:
let

#  Copyright 2013 The Android Open Source Project
#

media = java_binary {
    name = "media";
    wrapper = "media";
    srcs = ["**/*.java"];
};

in { inherit media; }
