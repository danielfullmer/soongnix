{ android_app }:
let

WiktionarySimple = android_app {
    name = "WiktionarySimple";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/simplewiktionary/SimpleWikiHelper.java"
        "src/com/example/android/simplewiktionary/WordWidget.java"
    ];
    sdk_version = "8";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit WiktionarySimple; }
