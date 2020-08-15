{ android_app }:
let

AppWidgetHostTest = android_app {
    name = "AppWidgetHostTest";
    srcs = [
        "src/com/android/tests/appwidgethost/AppWidgetContainerView.java"
        "src/com/android/tests/appwidgethost/AppWidgetHostActivity.java"
        "src/com/android/tests/appwidgethost/TestAppWidgetConfigure.java"
        "src/com/android/tests/appwidgethost/TestAppWidgetProvider.java"
    ];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit AppWidgetHostTest; }
