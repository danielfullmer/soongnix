{ cc_defaults, cc_library, cc_library_headers }:
let

#  Shared library for target
#  ========================================================
libnativeloader-defaults = cc_defaults {
    name = "libnativeloader-defaults";
    cflags = [
        "-Werror"
        "-Wall"
    ];
    cppflags = [
        "-fvisibility=hidden"
    ];
    header_libs = ["libnativeloader-headers"];
    export_header_lib_headers = ["libnativeloader-headers"];
};

libnativeloader = cc_library {
    name = "libnativeloader";
    defaults = ["libnativeloader-defaults"];
    host_supported = true;
    srcs = ["native_loader.cpp"];
    shared_libs = [
        "libnativehelper"
        "liblog"
        "libnativebridge"
        "libbase"
    ];
    target = {
        android = {
            shared_libs = [
                "libdl_android"
            ];
        };
    };
    required = [
        "llndk.libraries.txt"
        "vndksp.libraries.txt"
    ];
    stubs = {
        symbol_file = "libnativeloader.map.txt";
        versions = ["1"];
    };
};

#  TODO(b/124250621) eliminate the need for this library
libnativeloader_lazy = cc_library {
    name = "libnativeloader_lazy";
    defaults = ["libnativeloader-defaults"];
    host_supported = false;
    srcs = ["native_loader_lazy.cpp"];
    required = ["libnativeloader"];
};

libnativeloader-headers = cc_library_headers {
    name = "libnativeloader-headers";
    host_supported = true;
    export_include_dirs = ["include"];
};

#  TODO(jiyong) Remove this when its use in the internal master is
#  switched to libnativeloader-headers
libnativeloader-dummy-headers = cc_library_headers {
    name = "libnativeloader-dummy-headers";
    host_supported = true;
    export_include_dirs = ["include"];
};

in { inherit libnativeloader libnativeloader-defaults libnativeloader-dummy-headers libnativeloader-headers libnativeloader_lazy; }
