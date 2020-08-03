{ cc_defaults }:
let

mcld-defaults = cc_defaults {
    name = "mcld-defaults";
    defaults = ["llvm-defaults"];

    cppflags = [
        "-Wall"
        "-Wno-unused-parameter"
        "-Wno-unused-private-field"
        "-Wno-unused-const-variable"
        "-Werror"

        # To enable asserts:
        # "-D_DEBUG",
        # "-UNDEBUG",
    ];

    target = {
        arm_on_x86 = {
            cflags = [
                "-DPROVIDE_ARM_CODEGEN"
                "-DFORCE_BUILD_ARM"
            ];
        };
        arm_on_x86_64 = {
            cflags = [
                "-DPROVIDE_ARM_CODEGEN"
                "-DFORCE_BUILD_ARM"
            ];
        };
    };

    include_dirs = [
        "frameworks/compile/mclinker/include"
    ];
};

subdirs = [
    "lib"
    "tools/mcld"
];

in { inherit mcld-defaults; }
