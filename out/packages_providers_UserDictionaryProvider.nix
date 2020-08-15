{ android_app }:
let

UserDictionaryProvider = android_app {
    name = "UserDictionaryProvider";
    srcs = [
        "src/com/android/providers/userdictionary/DictionaryBackupAgent.java"
        "src/com/android/providers/userdictionary/UserDictionaryProvider.java"
    ];
    libs = ["ext"];
    platform_apis = true;
    certificate = "shared";
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit UserDictionaryProvider; }
