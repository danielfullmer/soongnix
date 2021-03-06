{ cc_library_static }:
let

libmcldTarget = cc_library_static {
    name = "libmcldTarget";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = [
        "ELFAttribute.cpp"
        "ELFAttributeData.cpp"
        "ELFAttributeValue.cpp"
        "ELFDynamic.cpp"
        "ELFEmulation.cpp"
        "GNUInfo.cpp"
        "GNULDBackend.cpp"
        "GOT.cpp"
        "OutputRelocSection.cpp"
        "PLT.cpp"
        "TargetLDBackend.cpp"
    ];
};

subdirs = [
    "AArch64"
    "ARM"
    "Mips"
    "X86"
];

in { inherit libmcldTarget; }
