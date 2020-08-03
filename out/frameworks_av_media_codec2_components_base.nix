{ cc_defaults, cc_library_shared, filegroup }:
let

#  DO NOT DEPEND ON THIS DIRECTLY
#  use libcodec2_soft-defaults instead
libcodec2_soft_common = cc_library_shared {
    name = "libcodec2_soft_common";
    defaults = ["libcodec2-impl-defaults"];
    vendor_available = true;

    srcs = [
        "SimpleC2Component.cpp"
        "SimpleC2Interface.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    export_shared_lib_headers = [
        "libsfplugin_ccodec_utils"
    ];

    shared_libs = [
        "libcutils" #  for properties
        "liblog" #  for ALOG
        "libsfplugin_ccodec_utils" #  for ImageCopy
        "libstagefright_foundation" #  for Mutexed
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    ldflags = ["-Wl,-Bsymbolic"];
};

codec2_soft_exports = filegroup {
    name = "codec2_soft_exports";
    srcs = ["exports.lds"];
};

#  public dependency for software codec implementation
#  to be used by code under media/codecs/* only as its stability is not guaranteed
libcodec2_soft-defaults = cc_defaults {
    name = "libcodec2_soft-defaults";
    defaults = ["libcodec2-impl-defaults"];
    vendor_available = true;
    version_script = ":codec2_soft_exports";
    export_shared_lib_headers = [
        "libsfplugin_ccodec_utils"
    ];

    shared_libs = [
        "libcodec2_soft_common"
        "libcutils" #  for properties
        "liblog" #  for ALOG
        "libsfplugin_ccodec_utils" #  for ImageCopy
        "libstagefright_foundation" #  for ColorUtils and MIME
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    ldflags = ["-Wl,-Bsymbolic"];
};

#  public dependency for software codec implementation
#  to be used by code under media/codecs/* only
libcodec2_soft_sanitize_all-defaults = cc_defaults {
    name = "libcodec2_soft_sanitize_all-defaults";

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

#  public dependency for software codec implementation
#  to be used by code under media/codecs/* only
libcodec2_soft_sanitize_signed-defaults = cc_defaults {
    name = "libcodec2_soft_sanitize_signed-defaults";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

#  TEMP: used by cheets2 project - remove when no longer used
libcodec2_simple_component = cc_library_shared {
    name = "libcodec2_simple_component";
    vendor_available = true;

    srcs = [
        "SimpleC2Interface.cpp"
    ];

    local_include_dirs = [
        "include"
    ];

    export_include_dirs = [
        "include"
    ];

    shared_libs = [
        "libcodec2"
        "libcodec2_vndk"
        "libcutils"
        "liblog"
        "libstagefright_foundation"
        "libutils"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    ldflags = ["-Wl,-Bsymbolic"];
};

in { inherit codec2_soft_exports libcodec2_simple_component libcodec2_soft-defaults libcodec2_soft_common libcodec2_soft_sanitize_all-defaults libcodec2_soft_sanitize_signed-defaults; }
