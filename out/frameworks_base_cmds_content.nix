{ java_binary }:
let

#  Copyright 2012 The Android Open Source Project

content = java_binary {
    name = "content";
    wrapper = "content";
    srcs = ["src/com/android/commands/content/Content.java"];
};

in { inherit content; }
