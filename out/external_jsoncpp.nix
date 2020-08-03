{ cc_defaults, cc_library, cc_library_static }:
let

libjsoncpp_defaults = cc_defaults {
    name = "libjsoncpp_defaults";

    srcs = [
        "src/lib_json/json_reader.cpp"
        "src/lib_json/json_value.cpp"
        "src/lib_json/json_writer.cpp"
    ];

    local_include_dirs = [
        "src/lib_json"
    ];

    include_build_directory = false;

    export_include_dirs = ["include"];

    cflags = [
        "-DJSON_USE_EXCEPTION=0"
        "-Wall"
        "-Werror"
        "-Wno-implicit-fallthrough"
        #  src/lib_json/json_reader.cpp:210  has -Wno-implicit-fallthrough
    ];

    target = {
        windows = {
            enabled = true;
        };
    };
};

libjsoncpp = cc_library {
    name = "libjsoncpp";
    defaults = ["libjsoncpp_defaults"];
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    host_supported = true;
    recovery_available = true;
};

libjsoncpp_ndk = cc_library_static {
    name = "libjsoncpp_ndk";
    defaults = ["libjsoncpp_defaults"];
    sdk_version = "9";
    stl = "libc++_static";
};

in { inherit libjsoncpp libjsoncpp_defaults libjsoncpp_ndk; }
