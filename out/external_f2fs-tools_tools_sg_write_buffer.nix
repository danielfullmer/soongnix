{ cc_binary, cc_defaults }:
let

sg3-utils-defaults = cc_defaults {
    name = "sg3-utils-defaults";
    cflags = [
        "-Wno-unused-function"
    ];
    local_include_dirs = [
        "include"
    ];
};

sg_write_buffer = cc_binary {
    name = "sg_write_buffer";
    defaults = ["sg3-utils-defaults"];
    srcs = [
        "sg_write_buffer.c"
        "sg_cmds_basic.c"
        "sg_cmds_basic2.c"
        "sg_cmds_extra.c"
        "sg_cmds_mmc.c"
        "sg_io_linux.c"
        "sg_lib.c"
        "sg_lib_data.c"
        "sg_pt_common.c"
        "sg_pt_linux.c"
        "sg_pt_linux_nvme.c"
    ];
    system_ext_specific = true;
};

in { inherit sg3-utils-defaults sg_write_buffer; }
