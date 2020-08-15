{ android_app }:
let

AppWidgetProvider = android_app {
    name = "AppWidgetProvider";
    srcs = ["src/com/android/tests/appwidgetprovider/TestAppWidgetProvider.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit AppWidgetProvider; }
