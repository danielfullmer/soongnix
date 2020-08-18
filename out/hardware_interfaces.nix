{ cc_defaults, hidl_package_root }:
let

"android.hardware" = hidl_package_root {
    name = "android.hardware";
    use_current = true;
};

hidl_defaults = cc_defaults {
    name = "hidl_defaults";
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

#  VTS tests must link to HAL definition libraries statically.
VtsHalTargetTestDefaults = cc_defaults {
    name = "VtsHalTargetTestDefaults";
    defaults = [
        "vts_target_tests_defaults"
        "hidl_defaults"
    ];

    #  Lists all dependencies that can *not* be expected on the device.
    static_libs = [
        "VtsHalHidlTargetTestBase"
        "libhidl-gen-utils"
    ];
    group_static_libs = true;

    #  Lists all system dependencies that can be expected on the device.
    shared_libs = [
        "libbase"
        #  All the following are dependencies of any HAL definition library.
        "libcutils"
        "liblog"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libutils"
    ];
    cflags = [
        "-O0"
        "-g"
    ];

};

in { inherit "android.hardware" VtsHalTargetTestDefaults hidl_defaults; }
