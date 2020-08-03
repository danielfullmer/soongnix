{ android_test }:
let

native-media = android_test {
    name = "native-media";
    srcs = [
        "src/com/example/nativemedia/NativeMedia.java"
        "src/com/example/nativemedia/MyGLSurfaceView.java"
    ];
    sdk_version = "current";
    certificate = "platform";
    jni_libs = ["libnative-media-jni"];
};

in { inherit native-media; }
