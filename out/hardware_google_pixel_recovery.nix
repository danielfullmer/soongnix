{ cc_library_static }:
let

librecovery_ui_pixel = cc_library_static {
    name = "librecovery_ui_pixel";
    owner = "google";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-pedantic"
    ];
    srcs = [
        "recovery_ui.cpp"
    ];

    whole_static_libs = [
        "libmisc_writer"
        "libbootloader_message"
        "libnos_for_recovery"
        "libnos_citadel_for_recovery"
    ];

    shared_libs = [
        "libbase"
        "librecovery_ui"
    ];
};

in { inherit librecovery_ui_pixel; }
