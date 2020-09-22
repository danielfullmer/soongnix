{ cc_defaults, cc_library, cc_library_static }:
let

libRSDispatch = cc_library_static {
    name = "libRSDispatch";
    vendor_available = true;

    srcs = ["rsDispatch.cpp"];

    include_dirs = [
        "frameworks/rs"
    ];
    header_libs = [
        "jni_headers"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-DRS_COMPATIBILITY_LIB"
    ];

    sdk_version = "9";
    shared_libs = [
        "libdl"
        "liblog"
    ];
    #  Used in librsjni, which is built as NDK code => no ASan.
    sanitize = {
        never = true;
    };
    stl = "none";
};

libRScpp-defaults = cc_defaults {
    name = "libRScpp-defaults";
    defaults = ["rs-version"];

    srcs = [
        "RenderScript.cpp"
        "BaseObj.cpp"
        "Element.cpp"
        "Type.cpp"
        "Allocation.cpp"
        "Script.cpp"
        "ScriptC.cpp"
        "ScriptIntrinsics.cpp"
        "ScriptIntrinsicBLAS.cpp"
        "Sampler.cpp"

        #  TODO: make this not a symlink
        "rsCppUtils.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];

    #  We need to export not just rs/cpp but also rs.  This is because
    #  RenderScript.h includes rsCppStructs.h, which includes rs/rsDefines.h.
    header_libs = ["rs-headers"];
    export_header_lib_headers = ["rs-headers"];
    export_include_dirs = ["."];

    shared_libs = [
        "libdl"
        "liblog"
    ];
};

libRScpp = cc_library {
    name = "libRScpp";
    defaults = ["libRScpp-defaults"];

    header_libs = [
        "libarect_headers"
        "libbase_headers"
        "libnativebase_headers"
        "libnativewindow_headers"
    ];

    shared_libs = [
        "libgui"
        "libutils"
    ];

    static_libs = ["libRSDispatch"];
};

libRScpp_static = cc_library_static {
    name = "libRScpp_static";
    defaults = ["libRScpp-defaults"];

    cflags = ["-DRS_COMPATIBILITY_LIB"];

    sdk_version = "9";
    whole_static_libs = ["libRSDispatch"];

    ldflags = [
        "-Wl,--exclude-libs,libc++_static.a"
    ];
    stl = "c++_static";
};

in { inherit libRSDispatch libRScpp libRScpp-defaults libRScpp_static; }
