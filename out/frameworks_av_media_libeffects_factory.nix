{ cc_binary, cc_library_headers, cc_library_shared }:
let

libeffects_headers = cc_library_headers {
    name = "libeffects_headers";
    vendor_available = true;
    export_include_dirs = ["include"];
    header_libs = ["libhardware_headers"];
    export_header_lib_headers = ["libhardware_headers"];
};

#  Effect factory library
libeffects = cc_library_shared {
    name = "libeffects";
    vendor = true;
    srcs = [
        "EffectsFactory.c"
        "EffectsConfigLoader.c"
        "EffectsFactoryState.c"
        "EffectsXmlConfigLoader.cpp"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
        "libdl"
        "libeffectsconfig"
    ];
    cflags = ["-fvisibility=hidden"];

    local_include_dirs = ["include/media"];

    header_libs = [
        "libaudioeffects"
        "libeffects_headers"
    ];
    export_header_lib_headers = ["libeffects_headers"];
};

dumpEffectConfigFile = cc_binary {
    name = "dumpEffectConfigFile";
    vendor = true;
    srcs = ["test/DumpConfig.cpp"];

    compile_multilib = "32";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    shared_libs = [
        "libeffectsconfig"
        "libeffects"
    ];
    local_include_dirs = [
        "."
        "include"
    ];
};

in { inherit dumpEffectConfigFile libeffects libeffects_headers; }
