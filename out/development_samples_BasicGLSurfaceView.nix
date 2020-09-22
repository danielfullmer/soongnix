{ android_app }:
let

BasicGLSurfaceView = android_app {
    name = "BasicGLSurfaceView";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/basicglsurfaceview/BasicGLSurfaceView.java"
        "src/com/example/android/basicglsurfaceview/BasicGLSurfaceViewActivity.java"
        "src/com/example/android/basicglsurfaceview/GLES20TriangleRenderer.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit BasicGLSurfaceView; }
