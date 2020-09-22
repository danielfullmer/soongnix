{ cc_binary, cc_genrule, cc_library, cc_library_headers }:
let

#  build time C++ available list of all HIDL interfaces in the tree
libhidlmetadata = cc_library {
    name = "libhidlmetadata";
    host_supported = true;
    srcs = [":hidl_metadata_in_cpp"];
    export_include_dirs = ["include"];

    cflags = ["-O0"];
};

libhidlmetadata_headers = cc_library_headers {
    name = "libhidlmetadata_headers";
    recovery_available = true;
    host_supported = true;
    export_include_dirs = ["include"];
};

#  private impl below

hidl_metadata_parser = cc_binary {
    name = "hidl_metadata_parser";
    host_supported = true;
    srcs = ["parser.cpp"];
    shared_libs = ["libjsoncpp"];
    visibility = [":__subpackages__"];
};

hidl_metadata_in_cpp = cc_genrule {
    name = "hidl_metadata_in_cpp";
    host_supported = true;
    cmd = "$(location hidl_metadata_parser) $(in) > $(genDir)/metadata.cpp";
    srcs = [
        ":hidl_metadata_json"
    ];
    tools = ["hidl_metadata_parser"];
    visibility = [":__subpackages__"];
    out = ["metadata.cpp"];
};

in { inherit hidl_metadata_in_cpp hidl_metadata_parser libhidlmetadata libhidlmetadata_headers; }
