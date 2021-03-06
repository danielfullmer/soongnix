{ cc_library_shared }:
let

libstagefright_soft_hevcdec = cc_library_shared {
    name = "libstagefright_soft_hevcdec";
    defaults = ["libstagefright_softomx-defaults"];

    static_libs = ["libhevcdec"];
    srcs = ["SoftHEVC.cpp"];

    cflags = [
        "-Wall"
        "-Wno-unused-variable"
    ];

    version_script = "exports.lds";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    #  We need this because the current asm generates the following link error:
    #  requires unsupported dynamic reloc R_ARM_REL32; recompile with -fPIC
    #  Bug: 16853291
    ldflags = ["-Wl,-Bsymbolic"];
};

in { inherit libstagefright_soft_hevcdec; }
