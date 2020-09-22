{ cc_defaults, cc_library_static, cc_test_library }:
let

use_libaidlvintf_gtest_helper_static = cc_defaults {
    name = "use_libaidlvintf_gtest_helper_static";
    static_libs = [
        "libaidlvintf_gtest_helper"
        "libbase"
        "libz"
        "libselinux"
        "libtinyxml2"
        "libvintf"
        "libutils"
    ];
};

test_compile_use_libaidlvintf_gtest_helper_static = cc_test_library {
    name = "test_compile_use_libaidlvintf_gtest_helper_static";
    defaults = ["use_libaidlvintf_gtest_helper_static"];
    visibility = [":__subpackages__"];
};

libaidlvintf_gtest_helper = cc_library_static {
    name = "libaidlvintf_gtest_helper";
    export_include_dirs = ["include"];
    srcs = [
        "Vintf.cpp"
    ];
    shared_libs = [
        "libbase"
        "libz"
        "libselinux"
        "libtinyxml2"
        "libvintf"
        "libutils"
    ];
};

in { inherit libaidlvintf_gtest_helper test_compile_use_libaidlvintf_gtest_helper_static use_libaidlvintf_gtest_helper_static; }
