{ cc_defaults, filegroup, soong_namespace }:
let

_missingName = soong_namespace {
};

bootctrl_hal_src = filegroup {
    name = "bootctrl_hal_src";
    srcs = [
        "boot_control.cpp"
    ];
};

bootctrl_hal_defaults = cc_defaults {
    name = "bootctrl_hal_defaults";
    proprietary = true;
    recovery_available = true;
    header_libs = [
        "libhardware_headers"
        "libsystem_headers"
    ];
    shared_libs = [
        "libcutils"
        "liblog"
        "libz"
    ];
    owner = "qti";
    relative_install_path = "hw";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    srcs = [
        ":bootctrl_hal_src"
    ];

};

in { inherit _missingName bootctrl_hal_defaults bootctrl_hal_src; }
