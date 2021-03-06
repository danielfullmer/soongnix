{ cc_library_static }:
let

libmcldAArch64Target = cc_library_static {
    name = "libmcldAArch64Target";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = [
        "AArch64CA53Erratum835769Stub.cpp"
        "AArch64CA53Erratum843419Stub2.cpp"
        "AArch64CA53Erratum843419Stub.cpp"
        "AArch64CA53ErratumStub.cpp"
        "AArch64Diagnostic.cpp"
        "AArch64ELFDynamic.cpp"
        "AArch64Emulation.cpp"
        "AArch64GOT.cpp"
        "AArch64LDBackend.cpp"
        "AArch64LongBranchStub.cpp"
        "AArch64PLT.cpp"
        "AArch64Relocator.cpp"
    ];
};

subdirs = ["TargetInfo"];

in { inherit libmcldAArch64Target; }
