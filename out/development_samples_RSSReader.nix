{ android_app }:
let

RSSReader = android_app {
    name = "RSSReader";
    srcs = [
        "src/com/example/android/rssreader/RssItem.java"
        "src/com/example/android/rssreader/RssReader.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit RSSReader; }
