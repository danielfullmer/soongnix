{ cc_library_static }:
let

libclangToolingCore = cc_library_static {
    name = "libclangToolingCore";
    defaults = ["clang-defaults"];
    srcs = [
        "Lookup.cpp"
        "QualTypeNames.cpp"
        "Replacement.cpp"
    ];
};

in { inherit libclangToolingCore; }
