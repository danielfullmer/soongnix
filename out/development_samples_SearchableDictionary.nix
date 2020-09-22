{ android_app }:
let

SearchableDictionary = android_app {
    name = "SearchableDictionary";
    srcs = [
        "src/com/example/android/searchabledict/DictionaryDatabase.java"
        "src/com/example/android/searchabledict/DictionaryProvider.java"
        "src/com/example/android/searchabledict/SearchableDictionary.java"
        "src/com/example/android/searchabledict/WordActivity.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit SearchableDictionary; }
