{ cc_library }:
let

libstagefright_enc_common = cc_library {
    name = "libstagefright_enc_common";
    vendor_available = true;

    srcs = ["cmnMemory.c"];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };

    export_include_dirs = ["include"];

    cflags = ["-Werror"];
};

in { inherit libstagefright_enc_common; }
