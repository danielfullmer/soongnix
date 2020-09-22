{ android_test }:
let

BuildWidget = android_test {
    name = "BuildWidget";
    #  Only compile source java files in this apk.
    srcs = ["src/com/android/buildwidget/BuildWidget.java"];
    sdk_version = "current";
};

in { inherit BuildWidget; }
