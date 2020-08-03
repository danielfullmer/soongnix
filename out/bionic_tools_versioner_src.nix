{ cc_binary_host }:
let

versioner = cc_binary_host {
    name = "versioner";

    defaults = ["llvm-build-host-tools-defaults"];

    srcs = [
        "versioner.cpp"
        "Arch.cpp"
        "CompilationType.cpp"
        "DeclarationDatabase.cpp"
        "Driver.cpp"
        "Preprocessor.cpp"
        "SymbolDatabase.cpp"
        "SymbolFileParser.cpp"
        "Utils.cpp"
        "VFS.cpp"
    ];

    shared_libs = [
        "libclang_cxx_host"
        "libLLVM_host"
        "libbase"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-unused-parameter"
        "-fno-omit-frame-pointer"

        "-D__STDC_CONSTANT_MACROS"
        "-D__STDC_LIMIT_MACROS"

        "-D_LIBCPP_ENABLE_CXX17_REMOVED_BINDERS"
    ];

    target = {
        host = {
            cppflags = [
                "-fno-rtti"
            ];
        };
        windows = {
            enabled = false;
        };
    };
};

in { inherit versioner; }
