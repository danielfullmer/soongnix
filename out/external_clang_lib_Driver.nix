{ cc_library_static }:
let

libclangDriver = cc_library_static {
    name = "libclangDriver";
    defaults = ["clang-defaults"];
    srcs = [
        "Action.cpp"
        "Compilation.cpp"
        "CrossWindowsToolChain.cpp"
        "Driver.cpp"
        "DriverOptions.cpp"
        "Job.cpp"
        "MSVCToolChain.cpp"
        "MinGWToolChain.cpp"
        "Multilib.cpp"
        "Phases.cpp"
        "SanitizerArgs.cpp"
        "Tool.cpp"
        "ToolChain.cpp"
        "ToolChains.cpp"
        "Tools.cpp"
        "Types.cpp"
    ];
};

in { inherit libclangDriver; }
