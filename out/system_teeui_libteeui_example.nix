{ cc_library_static }:
let

libteeui_example_layout = cc_library_static {
    name = "libteeui_example_layout";
    defaults = ["keystore_defaults"];
    srcs = [
        "fonts.S"
        "teeui.cpp"
    ];
    static_libs = [
        "libft2.nodep"
        "libteeui"
        "libteeui_localization"
    ];
    host_supported = true;
    cflags = [
        "-ffunction-sections"
    ];
};

in { inherit libteeui_example_layout; }
