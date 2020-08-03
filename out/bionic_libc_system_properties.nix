{ cc_library_static }:
let

libsystemproperties = cc_library_static {
    name = "libsystemproperties";
    defaults = ["libc_defaults"];
    srcs = [
        "context_node.cpp"
        "contexts_split.cpp"
        "contexts_serialized.cpp"
        "prop_area.cpp"
        "prop_info.cpp"
        "system_properties.cpp"
    ];
    whole_static_libs = [
        "libpropertyinfoparser"
    ];
    header_libs = [
        "libasync_safe_headers"
    ];

    include_dirs = [
        "bionic/libc"
        "bionic/libstdc++/include"
    ];
    export_include_dirs = ["include"];
};

in { inherit libsystemproperties; }
