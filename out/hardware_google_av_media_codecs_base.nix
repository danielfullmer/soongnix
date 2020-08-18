{ cc_defaults, cc_library_shared }:
let

#  DO NOT DEPEND ON THIS DIRECTLY
#  use libstagefright_soft_c2-defaults instead
libstagefright_soft_c2common = cc_library_shared {
    name = "libstagefright_soft_c2common";
    defaults = ["libstagefright_codec2-impl-defaults"];
    vendor_available = true;

    srcs = [
        "SimpleC2Component.cpp"
        "SimpleC2Interface.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    export_shared_lib_headers = [
        "libstagefright_ccodec_utils"
    ];

    shared_libs = [
        "libcutils" #  for properties
        "liblog" #  for ALOG
        "libstagefright_ccodec_utils" #  for ImageCopy
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

#  public dependency for software codec implementation
#  to be used by code under media/codecs/* only as its stability is not guaranteed
libstagefright_soft_c2-defaults = cc_defaults {
    name = "libstagefright_soft_c2-defaults";
    defaults = ["libstagefright_codec2-impl-defaults"];
    vendor_available = true;

    export_shared_lib_headers = [
        "libstagefright_ccodec_utils"
    ];

    shared_libs = [
        "libcutils" #  for properties
        "liblog" #  for ALOG
        "libstagefright_foundation" #  for ColorUtils and MIME
        "libstagefright_ccodec_utils" #  for ImageCopy
        "libstagefright_soft_c2common"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    ldflags = ["-Wl,-Bsymbolic"];
};

#  public dependency for software codec implementation
#  to be used by code under media/codecs/* only
libstagefright_soft_c2_sanitize_all-defaults = cc_defaults {
    name = "libstagefright_soft_c2_sanitize_all-defaults";

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
libstagefright_soft_c2_sanitize_signed-defaults = cc_defaults {
    name = "libstagefright_soft_c2_sanitize_signed-defaults";

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

#  TEMP: used by cheets2 project - remove when no longer used
libstagefright_simple_c2component = cc_library_shared {
    name = "libstagefright_simple_c2component";
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
        "libcutils"
        "liblog"
        "libstagefright_codec2"
        "libstagefright_codec2_vndk"
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

in { inherit libstagefright_simple_c2component libstagefright_soft_c2-defaults libstagefright_soft_c2_sanitize_all-defaults libstagefright_soft_c2_sanitize_signed-defaults libstagefright_soft_c2common; }
