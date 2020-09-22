{ cc_binary, cc_binary_host, cc_fuzz, cc_library, python_binary_host }:
let

#  Copyright 2010 The Android Open Source Project

libsparse = cc_library {
    name = "libsparse";
    host_supported = true;
    ramdisk_available = true;
    recovery_available = true;
    unique_host_soname = true;
    srcs = [
        "backed_block.cpp"
        "output_file.cpp"
        "sparse.cpp"
        "sparse_crc32.cpp"
        "sparse_err.cpp"
        "sparse_read.cpp"
    ];
    cflags = ["-Werror"];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
    shared_libs = [
        "libz"
        "libbase"
    ];
    target = {
        windows = {
            enabled = true;
        };
    };
};

simg2img = cc_binary {
    name = "simg2img";
    host_supported = true;
    srcs = [
        "simg2img.cpp"
        "sparse_crc32.cpp"
    ];
    static_libs = [
        "libsparse"
        "libz"
        "libbase"
    ];

    cflags = ["-Werror"];
};

img2simg = cc_binary {
    name = "img2simg";
    host_supported = true;
    srcs = ["img2simg.cpp"];
    static_libs = [
        "libsparse"
        "libz"
        "libbase"
    ];

    cflags = ["-Werror"];
};

append2simg = cc_binary_host {
    name = "append2simg";
    srcs = ["append2simg.cpp"];
    static_libs = [
        "libsparse"
        "libz"
        "libbase"
    ];

    cflags = ["-Werror"];
};

"simg_dump.py" = python_binary_host {
    name = "simg_dump.py";
    main = "simg_dump.py";
    srcs = ["simg_dump.py"];
    version = {
        py2 = {
            embedded_launcher = true;
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

sparse_fuzzer = cc_fuzz {
    name = "sparse_fuzzer";
    host_supported = false;
    srcs = [
        "sparse_fuzzer.cpp"
    ];
    static_libs = [
        "libsparse"
        "liblog"
    ];
};

in { inherit "simg_dump.py" append2simg img2simg libsparse simg2img sparse_fuzzer; }
