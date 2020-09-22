{ android_app }:
let

Tag = android_app {
    name = "Tag";
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "guava"
        "com.android.vcard"
    ];
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/apps/tag/TagViewer.java"
        "src/com/android/apps/tag/message/NdefMessageParser.java"
        "src/com/android/apps/tag/message/ParsedNdefMessage.java"
        "src/com/android/apps/tag/record/ImageRecord.java"
        "src/com/android/apps/tag/record/MimeRecord.java"
        "src/com/android/apps/tag/record/ParsedNdefRecord.java"
        "src/com/android/apps/tag/record/RecordUtils.java"
        "src/com/android/apps/tag/record/SmartPoster.java"
        "src/com/android/apps/tag/record/TextRecord.java"
        "src/com/android/apps/tag/record/UnknownRecord.java"
        "src/com/android/apps/tag/record/UriRecord.java"
        "src/com/android/apps/tag/record/VCardRecord.java"
    ];
    privileged = true;
    sdk_version = "current";
};

in { inherit Tag; }
