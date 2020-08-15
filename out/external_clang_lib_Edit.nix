{ cc_library_static }:
let

libclangEdit = cc_library_static {
    name = "libclangEdit";
    defaults = ["clang-defaults"];
    srcs = [
        "Commit.cpp"
        "EditedSource.cpp"
        "RewriteObjCFoundationAPI.cpp"
    ];
};

in { inherit libclangEdit; }
