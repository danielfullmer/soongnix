{ cc_binary, llvm_tblgen }:
let

#  Collect target specific code generation libraries
MCLD_ARM_LIBS = [
    "libmcldARMTarget"
    "libmcldARMInfo"
];
MCLD_AARCH64_LIBS = [
    "libmcldAArch64Target"
    "libmcldAArch64Info"
];
MCLD_MIPS_LIBS = [
    "libmcldMipsTarget"
    "libmcldMipsInfo"
];
MCLD_X86_LIBS = [
    "libmcldX86Target"
    "libmcldX86Info"
];

#  Build Options.inc from Options.td
mcld-gen-options = llvm_tblgen {
    name = "mcld-gen-options";
    in_ = "Options.td";
    outs = ["Options.inc"];
};

"ld.mc" = cc_binary {
    name = "ld.mc";
    defaults = ["mcld-defaults"];
    host_supported = true;
    generated_headers = ["mcld-gen-options"];

    srcs = ["Main.cpp"];

    #  arch-specific static libraries depend on libmcldTarget.
    #  Can be removed once soong supports transitive static library dependencies
    group_static_libs = true;
    static_libs = [
        "libmcldADT"
        "libmcldCore"
        "libmcldFragment"
        "libmcldLD"
        "libmcldLDVariant"
        "libmcldMC"
        "libmcldObject"
        "libmcldScript"
        "libmcldSupport"
        "libmcldTarget"
    ];

    shared_libs = [
        "libLLVM_android"
        "libz"
    ];

    target = {
        host = {
            static_libs = MCLD_ARM_LIBS ++ MCLD_AARCH64_LIBS ++
            MCLD_MIPS_LIBS ++ MCLD_X86_LIBS;
        };

        #  Add target specific code generation libraries
        android_arm = {
            static_libs = MCLD_ARM_LIBS;
        };
        android_arm64 = {
            #  Include ARM libs to enable 32-bit linking on AARCH64 targets
            static_libs = MCLD_ARM_LIBS ++ MCLD_AARCH64_LIBS;
        };
        android_mips = {
            static_libs = MCLD_MIPS_LIBS;
        };
        android_mips64 = {
            static_libs = MCLD_MIPS_LIBS;
        };
        android_x86 = {
            static_libs = MCLD_X86_LIBS;
        };
        android_x86_64 = {
            static_libs = MCLD_X86_LIBS;
        };
        arm_on_x86 = {
            static_libs = MCLD_ARM_LIBS ++ MCLD_AARCH64_LIBS;
        };
        arm_on_x86_64 = {
            static_libs = MCLD_ARM_LIBS ++ MCLD_AARCH64_LIBS;
        };
    };
};

in { inherit "ld.mc" mcld-gen-options; }
