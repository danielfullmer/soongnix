{ android_app }:
let

CustomLocale = android_app {
    name = "CustomLocale";
    srcs = [
        "src/com/android/customlocale2/ChangeLocale.java"
        "src/com/android/customlocale2/CustomLocaleActivity.java"
        "src/com/android/customlocale2/CustomLocaleReceiver.java"
        "src/com/android/customlocale2/NewLocaleDialog.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit CustomLocale; }
