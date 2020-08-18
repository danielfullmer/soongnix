{ cc_defaults, cc_library_headers, cc_library_shared }:
let

libstagefright_codec2_internal = cc_library_headers {
    name = "libstagefright_codec2_internal";

    export_include_dirs = [
        "internal"
    ];

    #  TODO: Remove this when this module is moved back to frameworks/av.
    vendor_available = true;
};

#  !!!DO NOT DEPEND ON THIS SHARED LIBRARY DIRECTLY!!!
#  use libstagefright_codec2-impl-defaults instead
libstagefright_codec2_vndk = cc_library_shared {
    name = "libstagefright_codec2_vndk";
    vendor_available = true;

    srcs = [
        "C2AllocatorIon.cpp"
        "C2AllocatorGralloc.cpp"
        "C2Buffer.cpp"
        "C2Config.cpp"
        "C2PlatformStorePluginLoader.cpp"
        "C2Store.cpp"
        "platform/C2BqBuffer.cpp"
        "util/C2Debug.cpp"
        "util/C2InterfaceHelper.cpp"
        "util/C2InterfaceUtils.cpp"
        "util/C2ParamUtils.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    export_shared_lib_headers = [
        "libbase"
        "android.hardware.media.bufferpool@1.0"
        "android.hidl.token@1.0-utils"
    ];

    local_include_dirs = [
        "internal"
    ];

    include_dirs = [
        "frameworks/native/include/media/hardware"
        "hardware/google/av/codec2/include"
    ];

    header_libs = [
        "libgui_headers"
    ];

    shared_libs = [
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.media.bufferpool@1.0"
        "android.hidl.token@1.0-utils"
        "libbase"
        "libbinder"
        "libcutils"
        "libdl"
        "libhardware"
        "libhidlbase"
        "libion"
        "libfmq"
        "liblog"
        "libstagefright_bufferqueue_helper"
        "libstagefright_foundation"
        "libstagefright_bufferpool@1.0"
        "libui"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

#  public dependency for implementing Codec 2 components
libstagefright_codec2-impl-defaults = cc_defaults {
    name = "libstagefright_codec2-impl-defaults";

    shared_libs = [
        "libbase" #  for C2_LOG
        "liblog" #  for ALOG
        "libstagefright_codec2"
        "libstagefright_codec2_vndk"
        "libutils"
    ];
};

#  public dependency for implementing Codec 2 framework utilities
#  THIS IS ONLY FOR FRAMEWORK USE ONLY
libstagefright_codec2-internal-defaults = cc_defaults {
    name = "libstagefright_codec2-internal-defaults";
    defaults = ["libstagefright_codec2-impl-defaults"];

    shared_libs = [
        "libcutils" #  for properties
    ];

    #  TODO: separate internal headers so they can be exposed here
};

in { inherit libstagefright_codec2-impl-defaults libstagefright_codec2-internal-defaults libstagefright_codec2_internal libstagefright_codec2_vndk; }
