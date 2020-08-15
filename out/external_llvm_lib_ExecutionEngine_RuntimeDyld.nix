{ cc_library_static }:
let

libLLVMRuntimeDyld = cc_library_static {
    name = "libLLVMRuntimeDyld";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "RTDyldMemoryManager.cpp"
        "RuntimeDyld.cpp"
        "RuntimeDyldCOFF.cpp"
        "RuntimeDyldChecker.cpp"
        "RuntimeDyldELF.cpp"
        "RuntimeDyldMachO.cpp"
    ];
};

in { inherit libLLVMRuntimeDyld; }
