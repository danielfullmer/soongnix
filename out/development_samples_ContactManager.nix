{ android_app }:
let

ContactManager = android_app {
    name = "ContactManager";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/contactmanager/ContactAdder.java"
        "src/com/example/android/contactmanager/ContactManager.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit ContactManager; }
