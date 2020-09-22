{ cc_library_host_shared }:
let

libteeui_jni = cc_library_host_shared {
    name = "libteeui_jni";
    defaults = ["keystore_defaults"];
    export_include_dirs = ["include"];
    srcs = [
        "libteeui_jni.cpp"
    ];
    static_libs = [
        "libft2.nodep"
        "libteeui"
        "libteeui_example_layout"
        "libteeui_localization"
    ];
};

in { inherit libteeui_jni; }
