{ cc_library_static }:
let

libcras = cc_library_static {
    name = "libcras";

    srcs = [
        "common/cras_audio_format.c"
        "common/cras_config.c"
        "common/cras_file_wait.c"
        "common/cras_util.c"
        "common/edid_utils.c"
        "libcras/cras_client.c"
        "libcras/cras_helpers.c"
    ];

    shared_libs = ["libtinyalsa"];

    export_include_dirs = [
        "common"
        "libcras"
    ];

    cflags = [
        "-DCRAS_SOCKET_FILE_DIR=\"/var/run/cras\""
        "-Wall"
        "-Werror"
        "-Wno-error=missing-field-initializers"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];
};

in { inherit libcras; }
