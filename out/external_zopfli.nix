{ cc_binary_host, cc_library }:
let

libzopfli = cc_library {
    name = "libzopfli";
    host_supported = true;

    cflags = [
        "-O2"
        "-Wno-unused-parameter"
        "-Werror"
    ];
    srcs = [
        "src/zopfli/blocksplitter.c"
        "src/zopfli/cache.c"
        "src/zopfli/deflate.c"
        "src/zopfli/gzip_container.c"
        "src/zopfli/hash.c"
        "src/zopfli/katajainen.c"
        "src/zopfli/lz77.c"
        "src/zopfli/squeeze.c"
        "src/zopfli/tree.c"
        "src/zopfli/util.c"
        "src/zopfli/zlib_container.c"
        "src/zopfli/zopfli_lib.c"
    ];
    export_include_dirs = ["src"];

    target = {
        windows = {
            enabled = true;
        };
    };
};

zopflipng = cc_binary_host {
    name = "zopflipng";

    cflags = [
        "-O2"
        "-Wno-unused-parameter"
        "-Werror"
    ];
    srcs = [
        "src/zopflipng/lodepng/lodepng.cpp"
        "src/zopflipng/lodepng/lodepng_util.cpp"
        "src/zopflipng/zopflipng_lib.cc"
        "src/zopflipng/zopflipng_bin.cc"
    ];

    static_libs = [
        "libzopfli"
    ];

};

in { inherit libzopfli zopflipng; }
