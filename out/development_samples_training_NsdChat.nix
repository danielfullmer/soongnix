{ android_app }:
let

NsdChat = android_app {
    name = "NsdChat";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/nsdchat/ChatConnection.java"
        "src/com/example/android/nsdchat/NsdChatActivity.java"
        "src/com/example/android/nsdchat/NsdHelper.java"
    ];
    sdk_version = "current";
    optimize = {
        proguard_flags_files = ["proguard.cfg"];
    };
};

in { inherit NsdChat; }
