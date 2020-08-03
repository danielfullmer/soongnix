{ cc_defaults, cc_library, cc_library_static }:
let

slicer_defaults = cc_defaults {
    name = "slicer_defaults";
    srcs = [
        "bytecode_encoder.cc"
        "code_ir.cc"
        "common.cc"
        "control_flow_graph.cc"
        "debuginfo_encoder.cc"
        "dex_bytecode.cc"
        "dex_format.cc"
        "dex_ir.cc"
        "dex_ir_builder.cc"
        "dex_utf8.cc"
        "instrumentation.cc"
        "reader.cc"
        "tryblocks_encoder.cc"
        "writer.cc"
    ];
    export_include_dirs = ["export"];
    device_supported = true;
    shared_libs = ["libz"];
    cflags = [
        "-Wall"
        "-Werror"
        #  TODO Remove these flags: b/65298177
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-Wno-shift-count-overflow"
        "-Wno-missing-braces"
    ];
};

slicer_ndk = cc_library_static {
    name = "slicer_ndk";
    defaults = [
        "slicer_defaults"
    ];
    host_supported = false;
    sdk_version = "current";
    stl = "libc++_static";
    rtti = true;
};

slicer = cc_library {
    name = "slicer";
    defaults = [
        "slicer_defaults"
    ];
    host_supported = true;
    rtti = true;
};

slicer_ndk_no_rtti = cc_library_static {
    name = "slicer_ndk_no_rtti";
    defaults = [
        "slicer_defaults"
    ];
    host_supported = false;
    sdk_version = "current";
    stl = "libc++_static";
};

slicer_no_rtti = cc_library {
    name = "slicer_no_rtti";
    defaults = [
        "slicer_defaults"
    ];
    host_supported = true;
};

in { inherit slicer slicer_defaults slicer_ndk slicer_ndk_no_rtti slicer_no_rtti; }
