{ cc_library_static }:
let

libmcldMipsTarget = cc_library_static {
    name = "libmcldMipsTarget";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = [
        "MipsAbiFlags.cpp"
        "MipsDiagnostic.cpp"
        "MipsELFDynamic.cpp"
        "MipsEmulation.cpp"
        "MipsGNUInfo.cpp"
        "MipsGOT.cpp"
        "MipsGOTPLT.cpp"
        "MipsLA25Stub.cpp"
        "MipsLDBackend.cpp"
        "MipsPLT.cpp"
        "MipsRelocator.cpp"
    ];
};

subdirs = ["TargetInfo"];

in { inherit libmcldMipsTarget; }
