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
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
        "android.hardware.power@1.3"
        "libbase"
        "libbinder"
        "libcutils"
        "libfmq"
        "libgui"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblayers_proto"
        "liblog"
        "libnativewindow"
        "libsync"
        "libtimestats_proto"
        "libui"
        "libutils"
    ];
    static_libs = [
        "libgmock"
        "librenderengine"
        "libtrace_proto"
    ];
    header_libs = [
        "android.hardware.graphics.composer@2.1-command-buffer"
        "android.hardware.graphics.composer@2.1-hal"
        "libsurfaceflinger_headers"
    ];
};

in { inherit sffakehwc_test; }
