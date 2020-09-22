{ android_test }:
let

AppNavigation = android_test {
    name = "AppNavigation";
    srcs = [
        "src/com/example/android/appnavigation/app/AppNavHomeActivity.java"
        "src/com/example/android/appnavigation/app/ContentCategoryActivity.java"
        "src/com/example/android/appnavigation/app/ContentViewActivity.java"
        "src/com/example/android/appnavigation/app/InterstitialMessageActivity.java"
        "src/com/example/android/appnavigation/app/NotificationsActivity.java"
        "src/com/example/android/appnavigation/app/OutsideTaskActivity.java"
        "src/com/example/android/appnavigation/app/PeerActivity.java"
        "src/com/example/android/appnavigation/app/SimpleUpActivity.java"
        "src/com/example/android/appnavigation/app/ViewFromOtherTaskActivity.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit AppNavigation; }
