{ cc_library_static }:
let

libLLVMProfileDataCoverage = cc_library_static {
    name = "libLLVMProfileDataCoverage";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "CoverageMapping.cpp"
        "CoverageMappingReader.cpp"
        "CoverageMappingWriter.cpp"
    ];
};

in { inherit libLLVMProfileDataCoverage; }
