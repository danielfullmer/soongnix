{ android_test }:
let

InternalTests = android_test {
    name = "InternalTests";
    proto = {
        type = "nano";
    };
    #  Include some source files directly to be able to access package members
    srcs = [
        "src/android/app/WallpaperColorsTest.java"
        "src/android/app/WallpaperInfoTest.java"
        "src/android/service/wallpaper/WallpaperServiceTest.java"
        "src/com/android/internal/colorextraction/ColorExtractorTest.java"
        "src/com/android/internal/colorextraction/types/TonalTest.java"
        "src/com/android/internal/graphics/ColorUtilsTest.java"
        "src/com/android/internal/ml/clustering/KMeansTest.java"
        "src/stub/DummyWallpaperService.java"
    ];
    libs = ["android.test.runner"];
    static_libs = [
        "junit"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "truth-prebuilt"
    ];
    java_resource_dirs = ["res"];
    certificate = "platform";
    platform_apis = true;
    test_suites = ["device-tests"];
};

in { inherit InternalTests; }
