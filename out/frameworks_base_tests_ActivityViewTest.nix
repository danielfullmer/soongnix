{ android_test }:
let

ActivityViewTest = android_test {
    name = "ActivityViewTest";
    srcs = [
        "src/com/google/android/test/activityview/ActivityViewActivity.java"
        "src/com/google/android/test/activityview/ActivityViewMainActivity.java"
        "src/com/google/android/test/activityview/ActivityViewResizeActivity.java"
        "src/com/google/android/test/activityview/ActivityViewScrollActivity.java"
        "src/com/google/android/test/activityview/ActivityViewTestActivity.java"
        "src/com/google/android/test/activityview/ActivityViewVisibilityActivity.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit ActivityViewTest; }
