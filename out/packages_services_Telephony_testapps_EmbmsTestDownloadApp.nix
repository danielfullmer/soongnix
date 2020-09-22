{ android_test }:
let

src_dirs = ["src"];
res_dirs = ["res"];
EmbmsTestDownloadApp = android_test {
    name = "EmbmsTestDownloadApp";
    static_libs = [
        "androidx.recyclerview_recyclerview"
        "androidx.legacy_legacy-support-v4"
    ];
    srcs = [
        "src/com/android/phone/testapps/embmsdownload/DownloadCompletionReceiver.java"
        "src/com/android/phone/testapps/embmsdownload/EmbmsTestDownloadApp.java"
        "src/com/android/phone/testapps/embmsdownload/SideChannel.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit EmbmsTestDownloadApp; }
