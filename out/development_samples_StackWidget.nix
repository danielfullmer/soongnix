{ android_test }:
let

StackWidget = android_test {
    name = "StackWidget";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/stackwidget/StackWidgetProvider.java"
        "src/com/example/android/stackwidget/StackWidgetService.java"
        "src/com/example/android/stackwidget/WidgetItem.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit StackWidget; }
