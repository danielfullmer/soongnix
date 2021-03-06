{ cc_library_static }:
let

libxz = cc_library_static {
    name = "libxz";
    host_supported = true;
    recovery_available = true;
    srcs = [
        "linux/lib/xz/xz_crc32.c"
        "linux/lib/xz/xz_dec_bcj.c"
        "linux/lib/xz/xz_dec_lzma2.c"
        "linux/lib/xz/xz_dec_stream.c"
    ];
    local_include_dirs = ["userspace"];

    #  Enable branch/call/jump filters. See http://b/27817327.
    cflags = [
        "-DXZ_DEC_X86"
        "-DXZ_DEC_ARM"
        "-DXZ_DEC_ARMTHUMB"
        "-Wall"
        "-Werror"
    ];

    export_include_dirs = ["linux/include/linux/"];
};

in { inherit libxz; }
