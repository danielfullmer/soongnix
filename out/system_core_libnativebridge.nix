{ cc_defaults, cc_library, cc_library_headers }:
let

libnativebridge-defaults = cc_defaults {
    name = "libnativebridge-defaults";
    cflags = [
        "-Werror"
        "-Wall"
    ];
    cppflags = [
        "-fvisibility=protected"
    ];
    header_libs = ["libnativebridge-headers"];
    export_header_lib_headers = ["libnativebridge-headers"];
};

libnativebridge-headers = cc_library_headers {
    name = "libnativebridge-headers";

    host_supported = true;
    export_include_dirs = ["include"];
};

libnativebridge = cc_library {
    name = "libnativebridge";
    defaults = ["libnativebridge-defaults"];

    host_supported = true;
    srcs = ["native_bridge.cc"];
    header_libs = [
        "libbase_headers"
    ];
    shared_libs = [
        "liblog"
    ];
    #  TODO(jiyong): remove this line after aosp/885921 lands
    export_include_dirs = ["include"];

    target = {
        android = {
            version_script = "libnativebridge.map.txt";
        };
        linux = {
            version_script = "libnativebridge.map.txt";
        };
    };

    stubs = {
        symbol_file = "libnativebridge.map.txt";
        versions = ["1"];
    };
};

#  TODO(b/124250621): eliminate the need for this library
libnativebridge_lazy = cc_library {
    name = "libnativebridge_lazy";
    defaults = ["libnativebridge-defaults"];

    host_supported = false;
    srcs = ["native_bridge_lazy.cc"];
    required = ["libnativebridge"];
};

subdirs = ["tests"];

in { inherit libnativebridge libnativebridge-defaults libnativebridge-headers libnativebridge_lazy; }
