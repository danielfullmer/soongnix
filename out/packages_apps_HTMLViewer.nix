{ android_app }:
let

HTMLViewer = android_app {
    name = "HTMLViewer";
    srcs = ["src/com/android/htmlviewer/HTMLViewerActivity.java"];
    sdk_version = "current";
};

in { inherit HTMLViewer; }
