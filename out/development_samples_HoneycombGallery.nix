{ android_app }:
let

HoneycombGallery = android_app {
    name = "HoneycombGallery";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/hcgallery/CameraActivity.java"
        "src/com/example/android/hcgallery/CameraFragment.java"
        "src/com/example/android/hcgallery/ContentActivity.java"
        "src/com/example/android/hcgallery/ContentFragment.java"
        "src/com/example/android/hcgallery/Directory.java"
        "src/com/example/android/hcgallery/DirectoryCategory.java"
        "src/com/example/android/hcgallery/DirectoryEntry.java"
        "src/com/example/android/hcgallery/FitCenterFrameLayout.java"
        "src/com/example/android/hcgallery/MainActivity.java"
        "src/com/example/android/hcgallery/TitlesFragment.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit HoneycombGallery; }
