{ android_app }:
let

AppWidgetProvider = android_app {
    name = "AppWidgetProvider";
    srcs = ["**/*.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit AppWidgetProvider; }
