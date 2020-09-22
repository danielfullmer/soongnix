{ cc_binary, cc_defaults, cc_library_shared, filegroup }:
let

gpuservice_defaults = cc_defaults {
    name = "gpuservice_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wformat"
        "-Wthread-safety"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

libgpuservice_defaults = cc_defaults {
    name = "libgpuservice_defaults";
    defaults = ["gpuservice_defaults"];
    cflags = [
        "-DLOG_TAG=\"GpuService\""
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "libgfxstats"
        "libgraphicsenv"
        "liblog"
        "libutils"
        "libvkjson"
    ];
    static_libs = [
        "libserviceutils"
    ];
    export_static_lib_headers = [
        "libserviceutils"
    ];
    export_shared_lib_headers = [
        "libgraphicsenv"
    ];
};

libgpuservice_production_defaults = cc_defaults {
    name = "libgpuservice_production_defaults";
    defaults = ["libgpuservice_defaults"];
    cflags = [
        "-fvisibility=hidden"
        "-fwhole-program-vtables" #  requires ThinLTO
    ];
    lto = {
        thin = true;
    };
};

libgpuservice_sources = filegroup {
    name = "libgpuservice_sources";
    srcs = [
        "GpuService.cpp"
    ];
};

libgpuservice = cc_library_shared {
    name = "libgpuservice";
    defaults = ["libgpuservice_production_defaults"];
    srcs = [
        ":libgpuservice_sources"
    ];
};

libgpuservice_binary = cc_defaults {
    name = "libgpuservice_binary";
    defaults = ["gpuservice_defaults"];
    shared_libs = [
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
    ];
    ldflags = ["-Wl,--export-dynamic"];
};

gpuservice_binary_sources = filegroup {
    name = "gpuservice_binary_sources";
    srcs = ["main_gpuservice.cpp"];
};

gpuservice = cc_binary {
    name = "gpuservice";
    defaults = ["libgpuservice_binary"];
    init_rc = ["gpuservice.rc"];
    srcs = [":gpuservice_binary_sources"];
    shared_libs = [
        "libgpuservice"
    ];
};

in { inherit gpuservice gpuservice_binary_sources gpuservice_defaults libgpuservice libgpuservice_binary libgpuservice_defaults libgpuservice_production_defaults libgpuservice_sources; }
