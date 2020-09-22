{ android_test }:
let

MirrorSurfaceTest = android_test {
    name = "MirrorSurfaceTest";
    srcs = ["src/com/google/android/test/mirrorsurface/MirrorSurfaceActivity.java"];
    platform_apis = true;
    certificate = "platform";
};

in { inherit MirrorSurfaceTest; }
