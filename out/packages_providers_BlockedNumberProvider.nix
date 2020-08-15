{ android_app }:
let

BlockedNumberProvider = android_app {
    name = "BlockedNumberProvider";

    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/providers/blockednumber/BlockedNumberBackupAgent.java"
        "src/com/android/providers/blockednumber/BlockedNumberDatabaseHelper.java"
        "src/com/android/providers/blockednumber/BlockedNumberProvider.java"
        "src/com/android/providers/blockednumber/Utils.java"
    ];
    static_libs = [
        "android-common"
        "guava"
    ];
    jacoco = {
        include_filter = ["com.android.providers.blockednumber.*"];
    };
    platform_apis = true;
    certificate = "shared";
    privileged = true;

};

in { inherit BlockedNumberProvider; }
