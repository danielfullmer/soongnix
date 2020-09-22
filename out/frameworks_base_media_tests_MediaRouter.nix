{ android_test }:
let

mediaroutertest = android_test {
    name = "mediaroutertest";

    srcs = [
        "src/com/android/mediaroutertest/MediaRouter2ManagerTest.java"
        "src/com/android/mediaroutertest/RoutingSessionInfoTest.java"
        "src/com/android/mediaroutertest/StubMediaRoute2ProviderService.java"
    ];

    libs = [
        "android.test.runner"
        "android.test.base"
    ];

    static_libs = [
        "android-support-test"
        "mockito-target-minus-junit4"
        "testng"
    ];

    platform_apis = true;
    certificate = "platform";
};

in { inherit mediaroutertest; }
