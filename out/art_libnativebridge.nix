{ cc_defaults, cc_library, cc_library_headers }:
let

libnativebridge-defaults = cc_defaults {
    name = "libnativebridge-defaults";
    defaults = ["art_defaults"];
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

    apex_available = [
        "//apex_available:platform"
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

libnativebridge = cc_library {
    name = "libnativebridge";
    defaults = ["libnativebridge-defaults"];
    visibility = [
        "//frameworks/base/cmds/app_process"
        #  TODO(b/133140750): Clean this up.
        "//frameworks/base/native/webview/loader/libwebviewchromium_loader"
    ];
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];

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
    visibility = [
        "//art/libnativebridge/tests"
        "//frameworks/base/core/jni"
        "//frameworks/native/opengl/libs"
        "//frameworks/native/vulkan/libvulkan"
    ];

    host_supported = false;
    srcs = ["native_bridge_lazy.cc"];
    required = ["libnativebridge"];
};

subdirs = ["tests"];

in { inherit libnativebridge libnativebridge-defaults libnativebridge-headers libnativebridge_lazy; }
