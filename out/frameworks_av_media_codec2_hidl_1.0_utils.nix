{ cc_defaults, cc_library }:
let

#  DO NOT DEPEND ON THIS DIRECTLY
#  use libcodec2-hidl-client-defaults instead
"libcodec2_hidl_client@1.0" = cc_library {
    name = "libcodec2_hidl_client@1.0";

    defaults = ["hidl_defaults"];

    srcs = [
        "ClientBlockHelper.cpp"
        "types.cpp"
    ];

    header_libs = [
        "libcodec2_internal" #  private
    ];

    shared_libs = [
        "android.hardware.media.bufferpool@2.0"
        "android.hardware.media.c2@1.0"
        "libbase"
        "libcodec2"
        "libcodec2_vndk"
        "libcutils"
        "libgui"
        "libhidlbase"
        "liblog"
        "libstagefright_bufferpool@2.0.1"
        "libui"
        "libutils"
    ];

    export_include_dirs = [
        "include"
    ];

    export_shared_lib_headers = [
        "android.hardware.media.c2@1.0"
        "libcodec2"
        "libgui"
        "libstagefright_bufferpool@2.0.1"
        "libui"
    ];
};

#  DO NOT DEPEND ON THIS DIRECTLY
#  use libcodec2-hidl-defaults instead
"libcodec2_hidl@1.0" = cc_library {
    name = "libcodec2_hidl@1.0";
    vendor_available = true;

    defaults = ["hidl_defaults"];

    srcs = [
        "Component.cpp"
        "ComponentInterface.cpp"
        "ComponentStore.cpp"
        "Configurable.cpp"
        "InputBufferManager.cpp"
        "InputSurface.cpp"
        "InputSurfaceConnection.cpp"
        "types.cpp"
    ];

    header_libs = [
        "libsystem_headers"
        "libcodec2_internal" #  private
    ];

    shared_libs = [
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.graphics.bufferqueue@2.0"
        "android.hardware.graphics.common@1.0"
        "android.hardware.media@1.0"
        "android.hardware.media.bufferpool@2.0"
        "android.hardware.media.c2@1.0"
        "android.hardware.media.omx@1.0"
        "libbase"
        "libcodec2"
        "libcodec2_vndk"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libstagefright_bufferpool@2.0.1"
        "libstagefright_bufferqueue_helper"
        "libui"
        "libutils"
    ];

    export_include_dirs = [
        "include"
    ];

    export_shared_lib_headers = [
        "android.hardware.media.c2@1.0"
        "libcodec2"
        "libcodec2_vndk"
        "libhidlbase"
        "libstagefright_bufferpool@2.0.1"
        "libui"
    ];
};

#  public dependency for Codec 2.0 HAL service implementations
libcodec2-hidl-defaults = cc_defaults {
    name = "libcodec2-hidl-defaults";
    defaults = ["libcodec2-impl-defaults"];

    shared_libs = [
        "android.hardware.media.c2@1.0"
        "libcodec2_hidl@1.0"
    ];
};

#  public dependency for Codec 2.0 HAL client
libcodec2-hidl-client-defaults = cc_defaults {
    name = "libcodec2-hidl-client-defaults";
    defaults = ["libcodec2-impl-defaults"];

    shared_libs = [
        "android.hardware.media.c2@1.0"
        "libcodec2_hidl_client@1.0"
    ];
};

in { inherit "libcodec2_hidl@1.0" "libcodec2_hidl_client@1.0" libcodec2-hidl-client-defaults libcodec2-hidl-defaults; }
