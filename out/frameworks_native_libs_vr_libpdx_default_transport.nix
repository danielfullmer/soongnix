{ cc_binary, cc_defaults, cc_library_shared }:
let

pdx_default_transport_compiler_defaults = cc_defaults {
    name = "pdx_default_transport_compiler_defaults";
    clang = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

pdx_default_transport_lib_defaults = cc_defaults {
    name = "pdx_default_transport_lib_defaults";
    export_include_dirs = ["private"];
    whole_static_libs = ["libpdx"];
};

pdx_use_transport_servicefs = cc_defaults {
    name = "pdx_use_transport_servicefs";
    export_include_dirs = ["private/servicefs"];
    whole_static_libs = [
        "libpdx_servicefs"
        "libservicefs"
    ];
};

pdx_use_transport_uds = cc_defaults {
    name = "pdx_use_transport_uds";
    export_include_dirs = ["private/uds"];
    whole_static_libs = ["libpdx_uds"];
};

libpdx_default_transport = cc_library_shared {
    name = "libpdx_default_transport";
    defaults = [
        "pdx_default_transport_compiler_defaults"
        "pdx_default_transport_lib_defaults"
        "pdx_use_transport_uds"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
        "libselinux"
    ];
};

pdx_tool = cc_binary {
    name = "pdx_tool";
    defaults = ["pdx_default_transport_compiler_defaults"];
    srcs = [
        "pdx_tool.cpp"
    ];
    shared_libs = [
        "libbinder"
        "libcutils"
        "liblog"
        "libpdx_default_transport"
    ];
};

#  Benchmarks.
pdx_benchmarks = cc_binary {
    name = "pdx_benchmarks";
    defaults = ["pdx_default_transport_compiler_defaults"];
    srcs = [
        "pdx_benchmarks.cpp"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libchrome"
        "libcutils"
        "liblog"
        "libutils"
        "libpdx_default_transport"
    ];
};

in { inherit libpdx_default_transport pdx_benchmarks pdx_default_transport_compiler_defaults pdx_default_transport_lib_defaults pdx_tool pdx_use_transport_servicefs pdx_use_transport_uds; }
