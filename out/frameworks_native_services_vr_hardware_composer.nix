{ cc_binary, cc_library_shared, cc_library_static, cc_test }:
let

libvr_hwc-hal = cc_library_shared {
    name = "libvr_hwc-hal";

    srcs = [
        "impl/vr_hwc.cpp"
        "impl/vr_composer_client.cpp"
    ];

    static_libs = [
        "libbroadcastring"
        "libdisplay"
    ];

    shared_libs = [
        "android.frameworks.vr.composer@1.0"
        "android.hardware.graphics.composer@2.1"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
        "libbase"
        "libbufferhubqueue"
        "libbinder"
        "libcutils"
        "libfmq"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libsync"
        "libui"
        "libutils"
        "libpdx_default_transport"
    ];

    header_libs = [
        "android.hardware.graphics.composer@2.1-command-buffer"
        "android.hardware.graphics.composer@2.1-hal"
    ];

    export_header_lib_headers = [
        "android.hardware.graphics.composer@2.1-hal"
    ];

    export_static_lib_headers = [
        "libdisplay"
    ];

    export_shared_lib_headers = [
        "android.frameworks.vr.composer@1.0"
        "android.hardware.graphics.composer@2.1"
    ];

    export_include_dirs = ["."];

    cflags = [
        "-DLOG_TAG=\"vr_hwc\""
        "-DATRACE_TAG=ATRACE_TAG_GRAPHICS"
        "-Wall"
        "-Werror"
        "-Wno-error=unused-private-field"
        #  Warnings in vr_hwc.cpp to be fixed after sync of goog/master.
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];

};

libvr_hwc-binder = cc_library_static {
    name = "libvr_hwc-binder";
    srcs = [
        "aidl/android/dvr/IVrComposer.aidl"
        "aidl/android/dvr/IVrComposerCallback.aidl"
        "aidl/android/dvr/parcelable_composer_frame.cpp"
        "aidl/android/dvr/parcelable_composer_layer.cpp"
        "aidl/android/dvr/parcelable_unique_fd.cpp"
    ];
    aidl = {
        include_dirs = ["frameworks/native/services/vr/hardware_composer/aidl"];
        export_aidl_headers = true;
    };
    export_include_dirs = ["aidl"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbinder"
        "libui"
        "libutils"
        "libvr_hwc-hal"
    ];
};

libvr_hwc-impl = cc_library_static {
    name = "libvr_hwc-impl";
    srcs = [
        "vr_composer.cpp"
    ];
    static_libs = [
        "libvr_hwc-binder"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "liblog"
        "libui"
        "libutils"
        "libvr_hwc-hal"
    ];
    export_shared_lib_headers = [
        "libvr_hwc-hal"
    ];
    cflags = [
        "-DLOG_TAG=\"vr_hwc\""
        "-Wall"
        "-Werror"
    ];
};

vr_hwc = cc_binary {
    name = "vr_hwc";
    vintf_fragments = ["manifest_vr_hwc.xml"];
    srcs = [
        "vr_hardware_composer_service.cpp"
    ];
    static_libs = [
        "libvr_hwc-impl"
        #  NOTE: This needs to be included after the *-impl lib otherwise the
        #  symbols in the *-binder library get optimized out.
        "libvr_hwc-binder"
    ];
    shared_libs = [
        "android.frameworks.vr.composer@1.0"
        "android.hardware.graphics.composer@2.1"
        "libbase"
        "libbinder"
        "liblog"
        "libhardware"
        "libhidlbase"
        "libui"
        "libutils"
        "libvr_hwc-hal"
    ];
    cflags = [
        "-DLOG_TAG=\"vr_hwc\""
        "-Wall"
        "-Werror"
    ];
    init_rc = [
        "vr_hwc.rc"
    ];
};

vr_hwc_test = cc_test {
    name = "vr_hwc_test";
    gtest = true;
    srcs = ["tests/vr_composer_test.cpp"];
    static_libs = [
        "libgtest"
        "libvr_hwc-impl"
        #  NOTE: This needs to be included after the *-impl lib otherwise the
        #  symbols in the *-binder library get optimized out.
        "libvr_hwc-binder"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        #  warnings in vr_composer_test.cpp to be fixed after merge of goog/master
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "liblog"
        "libui"
        "libutils"
    ];
};

in { inherit libvr_hwc-binder libvr_hwc-hal libvr_hwc-impl vr_hwc vr_hwc_test; }
