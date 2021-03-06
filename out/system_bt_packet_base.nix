{ cc_library_static }:
let

lib-bt-packets-base = cc_library_static {
    name = "lib-bt-packets-base";
    defaults = ["libchrome_support_defaults"];
    export_include_dirs = ["./"];
    host_supported = true;
    srcs = [
        "packet.cc"
        "iterator.cc"
        "packet_builder.cc"
    ];
};

in { inherit lib-bt-packets-base; }
