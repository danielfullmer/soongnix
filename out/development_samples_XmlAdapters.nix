{ android_app }:
let

xmladapters = android_app {
    name = "xmladapters";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/xmladapters/Adapters.java"
        "src/com/example/android/xmladapters/ContactPhotoBinder.java"
        "src/com/example/android/xmladapters/ContactsListActivity.java"
        "src/com/example/android/xmladapters/ImageDownloader.java"
        "src/com/example/android/xmladapters/PhotosListActivity.java"
        "src/com/example/android/xmladapters/RssReaderActivity.java"
        "src/com/example/android/xmladapters/UrlImageBinder.java"
        "src/com/example/android/xmladapters/UrlIntentListener.java"
        "src/com/example/android/xmladapters/XmlDocumentProvider.java"
    ];
    optimize = {
        enabled = false;
    };
    sdk_version = "8";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit xmladapters; }
