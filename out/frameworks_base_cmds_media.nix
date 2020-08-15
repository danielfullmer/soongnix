{ java_binary }:
let

#  Copyright 2013 The Android Open Source Project
#

media = java_binary {
    name = "media";
    wrapper = "media";
    srcs = [
        "src/com/android/commands/media/Media.java"
        "src/com/android/commands/media/VolumeCtrl.java"
    ];
};

in { inherit media; }
