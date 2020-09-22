{ filegroup, java_library_static }:
let

"services.appwidget-sources" = filegroup {
    name = "services.appwidget-sources";
    srcs = [
        "java/com/android/server/appwidget/AppWidgetService.java"
        "java/com/android/server/appwidget/AppWidgetServiceImpl.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.appwidget" = java_library_static {
    name = "services.appwidget";
    defaults = ["services_defaults"];
    srcs = [":services.appwidget-sources"];
    libs = ["services.core"];
};

in { inherit "services.appwidget" "services.appwidget-sources"; }
