{ cc_test }:
let

sffakehwc_test = cc_test {
    name = "sffakehwc_test";
    defaults = ["surfaceflinger_defaults"];
    test_suites = ["device-tests"];
    srcs = [
        "FakeComposerClient.cpp"
        "FakeComposerService.cpp"
        "FakeComposerUtils.cpp"
        "SFFakeHwc_test.cpp"
    ];
    shared_libs = [
        "android.hardware.graphics.composer@2.1"
        "android.hardware.graphics.composer@2.2"
        "android.hardware.graphics.composer@2.3"
        "android.hardware.graphics.composer@2.4"
        "android.hardware.graphics.composer@2.1-resources"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
        "android.hardware.graphics.mapper@4.0"
        "android.hardware.power@1.3"
        "libbase"
        "libbinder"
        "libcutils"
        "libfmq"
        "libgui"
        "libhidlbase"
        "liblayers_proto"
        "liblog"
        "libnativewindow"
        "libsync"
        "libtimestats"
        "libui"
        "libutils"
    ];
    static_libs = [
        "libcompositionengine"
        "libgmock"
        "libperfetto_client_experimental"
        "librenderengine"
        "libtrace_proto"
    ];
    header_libs = [
        "android.hardware.graphics.composer@2.4-command-buffer"
        "android.hardware.graphics.composer@2.4-hal"
        "libsurfaceflinger_headers"
    ];
};

in { inherit sffakehwc_test; }
