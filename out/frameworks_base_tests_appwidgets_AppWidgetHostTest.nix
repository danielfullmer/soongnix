{ android_app }:
let

AppWidgetHostTest = android_app {
    name = "AppWidgetHostTest";
    srcs = ["**/*.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit AppWidgetHostTest; }
