{ cc_library }:
let



"android.hardware.tests.bar@1.0-impl" = cc_library {
    name = "android.hardware.tests.bar@1.0-impl";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    srcs = [
        "Bar.cpp"
        "ImportTypes.cpp"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
        "libhidlbase"
        "liblog"
        "libutils"
    ];

    #  These are static libs only for testing purposes and portability. Shared
    #  libs should be used on device.
    static_libs = [
        "android.hardware.tests.foo@1.0"
        "android.hardware.tests.bar@1.0"
    ];
};

in { inherit "android.hardware.tests.bar@1.0-impl"; }
