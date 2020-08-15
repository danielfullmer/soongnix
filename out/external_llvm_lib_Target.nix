{ cc_library_static }:
let

libLLVMTarget = cc_library_static {
    name = "libLLVMTarget";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "Target.cpp"
        "TargetIntrinsicInfo.cpp"
        "TargetLoweringObjectFile.cpp"
        "TargetMachine.cpp"
        "TargetMachineC.cpp"
        "TargetRecip.cpp"
        "TargetSubtargetInfo.cpp"
    ];
};

subdirs = ["*"];

in { inherit libLLVMTarget; }
