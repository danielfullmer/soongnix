{ cc_defaults, cc_library_shared }:
let

libstagefright_omx = cc_library_shared {
    name = "libstagefright_omx";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;

    srcs = [
        "OMXMaster.cpp"
        "OMXNodeInstance.cpp"
        "OMXUtils.cpp"
        "OmxGraphicBufferSource.cpp"
        "1.0/Omx.cpp"
        "1.0/OmxStore.cpp"
        "1.0/WGraphicBufferSource.cpp"
        "1.0/WOmxNode.cpp"
        "1.0/WOmxObserver.cpp"
        "1.0/WOmxBufferSource.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    header_libs = [
        "libbase_headers"
        "media_plugin_headers"
    ];

    export_header_lib_headers = [
        "media_plugin_headers"
    ];

    shared_libs = [
        "libbase"
        "libbinder"
        "libmedia_omx"
        "libutils"
        "liblog"
        "libui"
        "libcutils"
        "libstagefright_foundation"
        "libstagefright_bufferqueue_helper"
        "libstagefright_xmlparser"
        "libdl"
        "libhidlbase"
        "libhidlmemory"
        "libvndksupport"
        "android.hardware.media.omx@1.0"
        "android.hardware.graphics.bufferqueue@1.0"
    ];

    export_shared_lib_headers = [
        "libstagefright_foundation"
        "libstagefright_xmlparser"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-unused-parameter"
        "-Wno-documentation"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };

};

libstagefright_softomx = cc_library_shared {
    name = "libstagefright_softomx";
    vendor_available = true;

    srcs = [
        "SimpleSoftOMXComponent.cpp"
        "SoftOMXComponent.cpp"
        "SoftVideoDecoderOMXComponent.cpp"
        "SoftVideoEncoderOMXComponent.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    header_libs = [
        "media_plugin_headers"
    ];

    export_header_lib_headers = [
        "media_plugin_headers"
    ];

    shared_libs = [
        "libstagefright_foundation"
        "liblog"
        "libui"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-unused-parameter"
        "-Wno-documentation"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };
};

libstagefright_softomx_plugin = cc_library_shared {
    name = "libstagefright_softomx_plugin";
    vendor_available = true;

    srcs = [
        "SoftOMXPlugin.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    header_libs = [
        "media_plugin_headers"
    ];

    export_header_lib_headers = [
        "media_plugin_headers"
    ];

    shared_libs = [
        "libstagefright_softomx"
        "libstagefright_foundation"
        "liblog"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-unused-parameter"
        "-Wno-documentation"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };
};

libstagefright_softomx-defaults = cc_defaults {
    name = "libstagefright_softomx-defaults";
    vendor_available = true;

    cflags = [
        "-Werror"
    ];

    header_libs = [
        "media_plugin_headers"
    ];

    shared_libs = [
        "libstagefright_softomx"
        "libstagefright_foundation"
        "libutils"
        "liblog"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };

    compile_multilib = "32";
};

libstagefright_omx_utils = cc_library_shared {
    name = "libstagefright_omx_utils";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    srcs = ["OMXUtils.cpp"];
    export_include_dirs = [
        "include"
    ];
    header_libs = [
        "media_plugin_headers"
    ];
    export_header_lib_headers = [
        "media_plugin_headers"
    ];
    shared_libs = [
        "libmedia_omx"
        "libstagefright_foundation"
        "liblog"
    ];
    export_shared_lib_headers = [
        "libmedia_omx"
    ];
    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit libstagefright_omx libstagefright_omx_utils libstagefright_softomx libstagefright_softomx-defaults libstagefright_softomx_plugin; }
