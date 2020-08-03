{ cc_library_shared }:
let

libradio_metadata = cc_library_shared {
    name = "libradio_metadata";
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    srcs = [
        "src/radio_metadata.c"
        "src/RadioMetadataWrapper.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-fvisibility=hidden"
    ];

    header_libs = ["libsystem_headers"];
    export_header_lib_headers = ["libsystem_headers"];

    local_include_dirs = ["include"];
    export_include_dirs = ["include"];

    shared_libs = [
        "libcutils"
        "liblog"
    ];
};

in { inherit libradio_metadata; }
