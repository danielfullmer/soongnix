{ cc_library_static }:
let

libmcldARMTarget = cc_library_static {
    name = "libmcldARMTarget";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = [
        "ARMDiagnostic.cpp"
        "ARMELFAttributeData.cpp"
        "ARMELFDynamic.cpp"
        "ARMEmulation.cpp"
        "ARMException.cpp"
        "ARMGOT.cpp"
        "ARMLDBackend.cpp"
        "ARMPLT.cpp"
        "ARMRelocator.cpp"
        "ARMToARMStub.cpp"
        "ARMToTHMStub.cpp"
        "THMToARMStub.cpp"
        "THMToTHMStub.cpp"
    ];
};

subdirs = ["TargetInfo"];

in { inherit libmcldARMTarget; }
