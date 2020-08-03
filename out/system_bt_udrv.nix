{ cc_library_static }:
let

libudrv-uipc = cc_library_static {
    name = "libudrv-uipc";
    defaults = ["fluoride_defaults"];
    srcs = [
        "ulinux/uipc.cc"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/internal_include"
        "system/bt/utils/include"
        "system/bt/stack/include"
    ];
    local_include_dirs = [
        "include"
    ];
    shared_libs = [
        "liblog"
    ];
};

in { inherit libudrv-uipc; }
