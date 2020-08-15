{ java_library_static }:
let

"services.appwidget" = java_library_static {
    name = "services.appwidget";
    srcs = [
        "java/com/android/server/appwidget/AppWidgetService.java"
        "java/com/android/server/appwidget/AppWidgetServiceImpl.java"
    ];
    libs = ["services.core"];
};

in { inherit "services.appwidget"; }
