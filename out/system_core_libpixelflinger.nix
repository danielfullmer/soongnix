{ cc_defaults, cc_library, cc_library_headers, cc_library_static }:
let

pixelflinger_defaults = cc_defaults {
    name = "pixelflinger_defaults";

    cflags = [
        "-fstrict-aliasing"
        "-fomit-frame-pointer"
        "-Wall"
        "-Werror"
        "-Wno-unused-function"
    ];
    export_include_dirs = ["include"];
    header_libs = ["libbase_headers"];
    shared_libs = [
        "libcutils"
        "liblog"
        "libutils"
    ];

    arch = {
        arm = {
            neon = {
                cflags = ["-D__ARM_HAVE_NEON"];
            };
        };
    };
};

libpixelflinger-arm = cc_library_static {
    name = "libpixelflinger-arm";
    defaults = ["pixelflinger_defaults"];

    srcs = [
        "fixed.cpp"
        "picker.cpp"
        "pixelflinger.cpp"
        "trap.cpp"
        "scanline.cpp"
    ];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
};

#  For the tests to use
libpixelflinger_internal = cc_library_headers {
    name = "libpixelflinger_internal";
    export_include_dirs = [
        "include"
        "."
    ];
};

libpixelflinger = cc_library {
    name = "libpixelflinger";
    defaults = ["pixelflinger_defaults"];

    srcs = [
        "codeflinger/ARMAssemblerInterface.cpp"
        "codeflinger/ARMAssemblerProxy.cpp"
        "codeflinger/CodeCache.cpp"
        "codeflinger/GGLAssembler.cpp"
        "codeflinger/load_store.cpp"
        "codeflinger/blending.cpp"
        "codeflinger/texturing.cpp"
        "format.cpp"
        "clear.cpp"
        "raster.cpp"
        "buffer.cpp"
    ];
    whole_static_libs = ["libpixelflinger-arm"];

    arch = {
        arm = {
            srcs = [
                "codeflinger/ARMAssembler.cpp"
                "codeflinger/disassem.c"
                "col32cb16blend.S"
                "t32cb16blend.S"
            ];

            neon = {
                srcs = ["col32cb16blend_neon.S"];
            };
        };
        arm64 = {
            srcs = [
                "codeflinger/Arm64Assembler.cpp"
                "codeflinger/Arm64Disassembler.cpp"
                "arch-arm64/col32cb16blend.S"
                "arch-arm64/t32cb16blend.S"
            ];
        };
        mips = {
            mips32r6 = {
                srcs = [
                    "codeflinger/MIPSAssembler.cpp"
                    "codeflinger/mips_disassem.c"
                    "arch-mips/t32cb16blend.S"
                ];
            };
        };
        mips64 = {
            srcs = [
                "codeflinger/MIPSAssembler.cpp"
                "codeflinger/MIPS64Assembler.cpp"
                "codeflinger/mips64_disassem.c"
                "arch-mips64/col32cb16blend.S"
                "arch-mips64/t32cb16blend.S"
            ];
        };
    };
};

in { inherit libpixelflinger libpixelflinger-arm libpixelflinger_internal pixelflinger_defaults; }
