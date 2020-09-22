{ java_binary_host }:
let

#  Copyright 2019 The Android Open Source Project
#

TeeuiFramebufferizer = java_binary_host {
    name = "TeeuiFramebufferizer";
    srcs = [
        "src/com/android/framebufferizer/Main.java"
        "src/com/android/framebufferizer/NativeRenderer.java"
        "src/com/android/framebufferizer/utils/DeviceInfo.java"
        "src/com/android/framebufferizer/utils/DeviceInfoDB.java"
        "src/com/android/framebufferizer/utils/FrameBufferBuffer.java"
    ];
    manifest = "manifest-teeui-framebufferizer.mf";
    required = [
        "libteeui_jni"
    ];
};

in { inherit TeeuiFramebufferizer; }
