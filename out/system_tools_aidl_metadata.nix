{ cc_binary, cc_genrule, cc_library }:
let

#  build time C++ available list of all AIDL interfaces in the tree
libaidlmetadata = cc_library {
    name = "libaidlmetadata";
    host_supported = true;
    srcs = [":aidl_metadata_in_cpp"];
    export_include_dirs = ["include"];

    cflags = ["-O0"];
};

#  private impl below

aidl_metadata_parser = cc_binary {
    name = "aidl_metadata_parser";
    host_supported = true;
    srcs = ["parser.cpp"];
    shared_libs = ["libjsoncpp"];
    visibility = [":__subpackages__"];
};

aidl_metadata_in_cpp = cc_genrule {
    name = "aidl_metadata_in_cpp";
    host_supported = true;
    cmd = "$(location aidl_metadata_parser) $(in) > $(genDir)/metadata.cpp";
    srcs = [
        ":aidl_metadata_json"
    ];
    tools = ["aidl_metadata_parser"];
    visibility = [":__subpackages__"];
    out = ["metadata.cpp"];
};

in { inherit aidl_metadata_in_cpp aidl_metadata_parser libaidlmetadata; }
