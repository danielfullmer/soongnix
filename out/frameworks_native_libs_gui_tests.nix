{ cc_test }:
let

#  Build the unit tests,

#  Build the binary to $(TARGET_OUT_DATA_NATIVE_TESTS)/$(LOCAL_MODULE)
#  to integrate with auto-test framework.
libgui_test = cc_test {
    name = "libgui_test";
    test_suites = ["device-tests"];

    clang = true;
    cflags = [
        "-Wall"
        "-Werror"
    ];

    srcs = [
        "BufferItemConsumer_test.cpp"
        "BufferQueue_test.cpp"
        "CpuConsumer_test.cpp"
        "EndToEndNativeInputTest.cpp"
        "DisplayedContentSampling_test.cpp"
        "FillBuffer.cpp"
        "GLTest.cpp"
        "IGraphicBufferProducer_test.cpp"
        "Malicious.cpp"
        "MultiTextureConsumer_test.cpp"
        "RegionSampling_test.cpp"
        "StreamSplitter_test.cpp"
        "SurfaceTextureClient_test.cpp"
        "SurfaceTextureFBO_test.cpp"
        "SurfaceTextureGLThreadToGL_test.cpp"
        "SurfaceTextureGLToGL_test.cpp"
        "SurfaceTextureGL_test.cpp"
        "SurfaceTextureMultiContextGL_test.cpp"
        "Surface_test.cpp"
        "TextureRenderer.cpp"
    ];

    shared_libs = [
        "android.hardware.configstore@1.0"
        "android.hardware.configstore-utils"
        "libbase"
        "liblog"
        "libEGL"
        "libGLESv1_CM"
        "libGLESv2"
        "libbinder"
        "libcutils"
        "libgui"
        "libhidlbase"
        "libhidltransport"
        "libinput"
        "libui"
        "libutils"
        "libnativewindow"
    ];
};

#  Build a separate binary to $(TARGET_OUT_DATA_NATIVE_TESTS)/$(LOCAL_MODULE)
#  This test has a main method, and requires a separate binary to be built.
#  To add move tests like this, just add additional cc_test statements,
#  as opposed to adding more source files to this one.
SurfaceParcelable_test = cc_test {
    name = "SurfaceParcelable_test";
    test_suites = ["device-tests"];

    clang = true;
    cflags = [
        "-Wall"
        "-Werror"
    ];

    srcs = [
        "SurfaceParcelable_test.cpp"
    ];

    shared_libs = [
        "liblog"
        "libbinder"
        "libcutils"
        "libgui"
        "libui"
        "libutils"
        "libbufferhubqueue" #  TODO(b/70046255): Remove these once BufferHub is integrated into libgui.
        "libpdx_default_transport"
    ];

    header_libs = [
        "libdvr_headers"
    ];
};

SamplingDemo = cc_test {
    name = "SamplingDemo";

    clang = true;
    cflags = [
        "-Wall"
        "-Werror"
    ];

    srcs = [
        "SamplingDemo.cpp"
    ];

    shared_libs = [
        "libbinder"
        "libcutils"
        "libgui"
        "liblog"
        "libui"
        "libutils"
    ];
};

in { inherit SamplingDemo SurfaceParcelable_test libgui_test; }
