{ cc_library_shared }:
let

#  The wrapper -DBUILD_FLOAT needs to match
#  the lvm library -DBUILD_FLOAT.

#  music bundle wrapper
libbundlewrapper = cc_library_shared {
    name = "libbundlewrapper";

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };

    vendor = true;
    srcs = ["Bundle/EffectBundle.cpp"];

    cflags = [
        "-fvisibility=hidden"
        "-DBUILD_FLOAT"
        "-DHIGHER_FS"
        "-DSUPPORT_MC"

        "-Wall"
        "-Werror"
    ];

    relative_install_path = "soundfx";

    static_libs = ["libmusicbundle"];

    shared_libs = [
        "libaudioutils"
        "libcutils"
        "libdl"
        "liblog"
    ];

    local_include_dirs = ["Bundle"];

    header_libs = [
        "libhardware_headers"
        "libaudioeffects"
    ];
};

#  reverb wrapper
libreverbwrapper = cc_library_shared {
    name = "libreverbwrapper";

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };

    vendor = true;
    srcs = ["Reverb/EffectReverb.cpp"];

    cflags = [
        "-fvisibility=hidden"
        "-DBUILD_FLOAT"
        "-DHIGHER_FS"

        "-Wall"
        "-Werror"
    ];

    relative_install_path = "soundfx";

    static_libs = ["libreverb"];

    shared_libs = [
        "libaudioutils"
        "libcutils"
        "libdl"
        "liblog"
    ];

    local_include_dirs = ["Reverb"];

    header_libs = [
        "libhardware_headers"
        "libaudioeffects"
    ];

    sanitize = {
        integer_overflow = true;
    };
};

in { inherit libbundlewrapper libreverbwrapper; }
