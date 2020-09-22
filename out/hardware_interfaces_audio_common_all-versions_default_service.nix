{ cc_binary, phony }:
let

"android.hardware.audio.service" = cc_binary {
    name = "android.hardware.audio.service";

    init_rc = ["android.hardware.audio.service.rc"];
    relative_install_path = "hw";
    vendor = true;
    #  Only support 32 bit  as the binary must always be installed at the same
    #  location for init to start it and the build system does not support
    #  having two binaries installable to the same location even if they are
    #  not installed in the same build.
    compile_multilib = "32";
    srcs = ["service.cpp"];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    shared_libs = [
        "libcutils"
        "libbinder"
        "libhidlbase"
        "liblog"
        "libutils"
        "libhardware"
    ];
};

#  Legacy service name, use android.hardware.audio.service instead
"android.hardware.audio@2.0-service" = phony {
    name = "android.hardware.audio@2.0-service";
    required = ["android.hardware.audio.service"];
};

in { inherit "android.hardware.audio.service" "android.hardware.audio@2.0-service"; }
