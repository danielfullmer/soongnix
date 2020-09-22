{ java_binary }:
let

#  Copyright 2012 The Android Open Source Project
#

requestsync = java_binary {
    name = "requestsync";
    wrapper = "requestsync";
    srcs = ["src/com/android/commands/requestsync/RequestSync.java"];
};

in { inherit requestsync; }
