{ cc_binary, cc_defaults, filegroup }:
let

gpuservice_sources = filegroup {
    name = "gpuservice_sources";
    srcs = [
        "GpuService.cpp"
        "gpustats/GpuStats.cpp"
    ];
};

gpuservice_binary_sources = filegroup {
    name = "gpuservice_binary_sources";
    srcs = ["main_gpuservice.cpp"];
};

gpuservice_defaults = cc_defaults {
    name = "gpuservice_defaults";
    cflags = [
        "-DLOG_TAG=\"GpuService\""
        "-Wall"
        "-Werror"
        "-Wformat"
        "-Wthread-safety"
        "-Wunused"
        "-Wunreachable-code"
    ];
    srcs = [
        ":gpuservice_sources"
    ];
    include_dirs = [
        "frameworks/native/vulkan/vkjson"
        "frameworks/native/vulkan/include"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "libgraphicsenv"
        "liblog"
        "libutils"
        "libvulkan"
    ];
    static_libs = [
        "libserviceutils"
        "libvkjson"
    ];
};

gpuservice_production_defaults = cc_defaults {
    name = "gpuservice_production_defaults";
    defaults = ["gpuservice_defaults"];
    cflags = [
        "-fvisibility=hidden"
        "-fwhole-program-vtables" #  requires ThinLTO
    ];
    lto = {
        thin = true;
    };
};

gpuservice_binary = cc_defaults {
    name = "gpuservice_binary";
    defaults = ["gpuservice_defaults"];
    whole_static_libs = [
        "libsigchain"
    ];
    shared_libs = [
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
    ];
    ldflags = ["-Wl,--export-dynamic"];
};

gpuservice = cc_binary {
    name = "gpuservice";
    defaults = ["gpuservice_binary"];
    init_rc = ["gpuservice.rc"];
    srcs = [":gpuservice_binary_sources"];
};

in { inherit gpuservice gpuservice_binary gpuservice_binary_sources gpuservice_defaults gpuservice_production_defaults gpuservice_sources; }
