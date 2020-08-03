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
    srcs = ["src/**/*.java"];
    platform_apis = true;
    instrumentation_for = "Gallery";
};

in { inherit GalleryTests; }
