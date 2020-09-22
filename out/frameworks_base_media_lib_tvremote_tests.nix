{ android_test }:
let

TvRemoteTests = android_test {
    name = "TvRemoteTests";
    srcs = ["src/com/android/media/tv/remoteprovider/TvRemoteProviderTest.java"];
    libs = [
        "android.test.runner"
        "android.test.base"
        "com.android.media.tv.remoteprovider"
    ];
    static_libs = [
        "mockito-target-minus-junit4"
    ];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
};

in { inherit TvRemoteTests; }
