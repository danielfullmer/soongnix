{ java_library_static }:
let

"services.appwidget" = java_library_static {
    name = "services.appwidget";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.appwidget"; }
