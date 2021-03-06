{ cc_library_static }:
let

#  Utils static library for target
#  ========================================================
libbt-utils = cc_library_static {
    name = "libbt-utils";
    defaults = ["fluoride_defaults"];
    local_include_dirs = [
        "include"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/btcore/include"
        "system/bt/stack/include"
    ];
    srcs = ["src/bt_utils.cc"];
    shared_libs = [
        "libprocessgroup"
    ];
};

in { inherit libbt-utils; }
