{ android_app }:
let

HTMLViewer = android_app {
    name = "HTMLViewer";
    srcs = ["**/*.java"];
    sdk_version = "current";
};

in { inherit HTMLViewer; }
