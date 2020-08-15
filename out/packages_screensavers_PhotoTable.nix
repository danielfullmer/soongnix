{ android_app }:
let

PhotoTable = android_app {
    name = "PhotoTable";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/dreams/phototable/AlbumDataAdapter.java"
        "src/com/android/dreams/phototable/AlbumSettings.java"
        "src/com/android/dreams/phototable/BummerView.java"
        "src/com/android/dreams/phototable/CursorPhotoSource.java"
        "src/com/android/dreams/phototable/DragGestureDetector.java"
        "src/com/android/dreams/phototable/EdgeSwipeDetector.java"
        "src/com/android/dreams/phototable/FlipperDream.java"
        "src/com/android/dreams/phototable/FlipperDreamSettings.java"
        "src/com/android/dreams/phototable/KeyboardInterpreter.java"
        "src/com/android/dreams/phototable/LocalSource.java"
        "src/com/android/dreams/phototable/PhotoCarousel.java"
        "src/com/android/dreams/phototable/PhotoDreamSettingsReceiver.java"
        "src/com/android/dreams/phototable/PhotoSource.java"
        "src/com/android/dreams/phototable/PhotoSourcePlexor.java"
        "src/com/android/dreams/phototable/PhotoTable.java"
        "src/com/android/dreams/phototable/PhotoTableDream.java"
        "src/com/android/dreams/phototable/PhotoTableDreamSettings.java"
        "src/com/android/dreams/phototable/PhotoTouchListener.java"
        "src/com/android/dreams/phototable/PicasaSource.java"
        "src/com/android/dreams/phototable/SectionedAlbumDataAdapter.java"
        "src/com/android/dreams/phototable/SoftLandingInterpolator.java"
        "src/com/android/dreams/phototable/StockSource.java"
    ];
    product_specific = true;
    sdk_version = "current";
};

in { inherit PhotoTable; }
