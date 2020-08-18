{ cc_defaults, cc_library }:
let

#  DO NOT DEPEND ON THIS DIRECTLY
#  use libstagefright_codec2-hidl-defaults instead
"libcodec2_hidl_utils@1.0" = cc_library {
    name = "libcodec2_hidl_utils@1.0";
    vendor_available = true;

    defaults = ["hidl_defaults"];

    srcs = [
        "Component.cpp"
        "ComponentStore.cpp"
        "Configurable.cpp"
        "InputSurface.cpp"
        "InputSurfaceConnection.cpp"
        "types.cpp"
    ];

    header_libs = [
        "libgui_headers"
        "libsystem_headers"
        "libstagefright_codec2_internal" #  private
    ];

    shared_libs = [
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.graphics.common@1.0"
        "android.hardware.media.bufferpool@1.0"
        "android.hardware.media.omx@1.0"
        "android.hardware.media@1.0"
        "android.hidl.token@1.0-utils"
        "hardware.google.media.c2@1.0"
        "libbase"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libstagefright_bufferpool@1.0"
        "libstagefright_bufferqueue_helper"
        "libstagefright_codec2"
        "libstagefright_codec2_vndk"
        "libui"
        "libutils"
    ];

    export_include_dirs = [
        "include"
    ];

    export_shared_lib_headers = [
        "android.hidl.token@1.0-utils"
        "hardware.google.media.c2@1.0"
        "libhidlbase"
        "libstagefright_bufferpool@1.0"
        "libstagefright_bufferqueue_helper"
        "libstagefright_codec2"
        "libui"
    ];
};

#  public dependency for Codec 2.0 HAL service implementations
libstagefright_codec2-hidl-defaults = cc_defaults {
    name = "libstagefright_codec2-hidl-defaults";
    defaults = ["libstagefright_codec2-impl-defaults"];

    shared_libs = [
        "hardware.google.media.c2@1.0"
        "libcodec2_hidl_utils@1.0"
    ];
};

in { inherit "libcodec2_hidl_utils@1.0" libstagefright_codec2-hidl-defaults; }
