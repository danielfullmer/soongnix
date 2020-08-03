{ cc_binary, cc_defaults, cc_library_static, cc_test }:
let

puffin_defaults = cc_defaults {
    name = "puffin_defaults";
    host_supported = true;
    shared_libs = [
        "libchrome"
        "libprotobuf-cpp-lite"
    ];
    static_libs = [
        "libbrotli"
        "libbz"
    ];
    export_include_dirs = ["src/include"];
    cflags = [
        "-DUSE_BRILLO=1"
        "-D_FILE_OFFSET_BITS=64"
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wimplicit-fallthrough"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

libpuffpatch = cc_library_static {
    name = "libpuffpatch";
    defaults = ["puffin_defaults"];
    recovery_available = true;
    srcs = [
        "puffin/src/puffin.proto"
        "src/bit_reader.cc"
        "src/bit_writer.cc"
        "src/huffer.cc"
        "src/huffman_table.cc"
        "src/puff_reader.cc"
        "src/puff_writer.cc"
        "src/puffer.cc"
        "src/puffin_stream.cc"
        "src/puffpatch.cc"
    ];
    static_libs = [
        "libbspatch"
    ];
    proto = {
        type = "lite";
        export_proto_headers = true;
    };
};

libpuffdiff = cc_library_static {
    name = "libpuffdiff";
    defaults = ["puffin_defaults"];
    srcs = [
        "src/file_stream.cc"
        "src/memory_stream.cc"
        "src/puffdiff.cc"
        "src/utils.cc"
    ];
    static_libs = [
        "libbsdiff"
        "libpuffpatch"
    ];
};

puffin = cc_binary {
    name = "puffin";
    defaults = ["puffin_defaults"];
    srcs = [
        "src/extent_stream.cc"
        "src/main.cc"
    ];
    shared_libs = [
        "libbrillo"
    ];
    static_libs = [
        "libbsdiff"
        "libbspatch"
        "libdivsufsort"
        "libdivsufsort64"
        "libpuffdiff"
        "libpuffpatch"
    ];
};

puffin_unittest = cc_test {
    name = "puffin_unittest";
    defaults = ["puffin_defaults"];
    test_suites = ["device-tests"];
    cflags = ["-Wno-sign-compare"];
    srcs = [
        "src/bit_io_unittest.cc"
        "src/extent_stream.cc"
        "src/patching_unittest.cc"
        "src/puff_io_unittest.cc"
        "src/puffin_unittest.cc"
        "src/stream_unittest.cc"
        "src/testrunner.cc"
        "src/unittest_common.cc"
        "src/utils_unittest.cc"
    ];
    shared_libs = [
        "libbrillo"
    ];
    static_libs = [
        "libbsdiff"
        "libbspatch"
        "libdivsufsort"
        "libdivsufsort64"
        "libpuffdiff"
        "libpuffpatch"
    ];
};

in { inherit libpuffdiff libpuffpatch puffin puffin_defaults puffin_unittest; }
