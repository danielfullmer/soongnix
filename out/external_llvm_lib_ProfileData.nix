{ cc_library_static }:
let

libLLVMProfileData = cc_library_static {
    name = "libLLVMProfileData";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "InstrProf.cpp"
        "InstrProfReader.cpp"
        "InstrProfWriter.cpp"
        "ProfileSummaryBuilder.cpp"
        "SampleProf.cpp"
        "SampleProfReader.cpp"
        "SampleProfWriter.cpp"
    ];
};

subdirs = ["*"];

in { inherit libLLVMProfileData; }
