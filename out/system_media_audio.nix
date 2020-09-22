{ cc_library_headers, filegroup }:
let

libaudio_system_headers = cc_library_headers {
    name = "libaudio_system_headers";
    host_supported = true;
    vendor_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;

    header_libs = ["libcutils_headers"];
    export_header_lib_headers = ["libcutils_headers"];

    export_include_dirs = ["include"];

    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
        };
        vendor = {
            cflags = ["-DAUDIO_NO_SYSTEM_DECLARATIONS"];
        };
    };
    min_sdk_version = "29";
};

libaudio_system_audio_base = filegroup {
    name = "libaudio_system_audio_base";
    srcs = [
        "include/system/audio-base.h"
    ];
    path = "include";
};

in { inherit libaudio_system_audio_base libaudio_system_headers; }
