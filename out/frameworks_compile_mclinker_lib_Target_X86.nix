{ cc_library_static }:
let

libmcldX86Target = cc_library_static {
    name = "libmcldX86Target";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = [
        "X86Diagnostic.cpp"
        "X86ELFDynamic.cpp"
        "X86Emulation.cpp"
        "X86GOT.cpp"
        "X86GOTPLT.cpp"
        "X86LDBackend.cpp"
        "X86PLT.cpp"
        "X86Relocator.cpp"
    ];
};

subdirs = ["TargetInfo"];

in { inherit libmcldX86Target; }
