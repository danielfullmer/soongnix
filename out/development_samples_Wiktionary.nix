{ android_app }:
let

Wiktionary = android_app {
    name = "Wiktionary";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/wiktionary/ExtendedWikiHelper.java"
        "src/com/example/android/wiktionary/LookupActivity.java"
        "src/com/example/android/wiktionary/SimpleWikiHelper.java"
        "src/com/example/android/wiktionary/WordWidget.java"
    ];
    sdk_version = "8";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit Wiktionary; }
