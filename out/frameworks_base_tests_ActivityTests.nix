{ android_test }:
let

ActivityTest = android_test {
    name = "ActivityTest";
    srcs = [
        "src/com/google/android/test/activity/ActivityTestMain.java"
        "src/com/google/android/test/activity/AlarmSpamReceiver.java"
        "src/com/google/android/test/activity/ArrayMapTests.java"
        "src/com/google/android/test/activity/CustomSplashscreenActivity.java"
        "src/com/google/android/test/activity/DisableScreenshotsActivity.java"
        "src/com/google/android/test/activity/DocActivity.java"
        "src/com/google/android/test/activity/EmptyService.java"
        "src/com/google/android/test/activity/IsolatedService.java"
        "src/com/google/android/test/activity/ServiceUserTarget.java"
        "src/com/google/android/test/activity/SingleUserProvider.java"
        "src/com/google/android/test/activity/SingleUserReceiver.java"
        "src/com/google/android/test/activity/SingleUserService.java"
        "src/com/google/android/test/activity/SlowReceiver.java"
        "src/com/google/android/test/activity/SpamActivity.java"
        "src/com/google/android/test/activity/StartEmpty.java"
        "src/com/google/android/test/activity/TrackTimeReceiver.java"
        "src/com/google/android/test/activity/UserTarget.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit ActivityTest; }
