{ cc_library_host_shared, cc_test }:
let

teeui_unit_tests = cc_test {
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-O0"
    ];
    srcs = [
        "teeui_test.cpp"
        "gtest_main.cpp"
    ];
    name = "teeui_unit_tests";
    static_libs = [
        "libteeui"
        "libft2.nodep"
    ];
    host_supported = true;
};

libteeui_localization_rendering_test = cc_library_host_shared {
    name = "libteeui_localization_rendering_test";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-O0"
    ];
    export_include_dirs = ["include"];
    srcs = [
        "teeui_locale_test.cpp"
        "teeui_device_config.cpp"
    ];
    static_libs = [
        "libteeui_example_layout"
        "libteeui"
        "libft2.nodep"
        "libteeui_localization"
        "libgtest"
    ];
};

in { inherit libteeui_localization_rendering_test teeui_unit_tests; }
