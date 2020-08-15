{ android_test }:
let

GalleryTests = android_test {
    name = "GalleryTests";
    certificate = "media";
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];
    #  Include all test java files.
    srcs = [
        "src/com/android/camera/BitmapManagerUnitTests.java"
        "src/com/android/camera/CameraLaunchPerformance.java"
        "src/com/android/camera/UnitTests.java"
        "src/com/android/camera/gallery/ImageListUberUnitTests.java"
        "src/com/android/camera/gallery/LruCacheUnitTests.java"
        "src/com/android/camera/gallery/MockImage.java"
        "src/com/android/camera/gallery/MockImageList.java"
    ];
    platform_apis = true;
    instrumentation_for = "Gallery";
};

in { inherit GalleryTests; }
