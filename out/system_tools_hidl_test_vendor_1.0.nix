{ hidl_interface }:
let

"hidl.tests.vendor@1.0" = hidl_interface {
    name = "hidl.tests.vendor@1.0";
    owner = "some-owner-name";
    root = "hidl.tests";
    system_ext_specific = true;
    srcs = [
        "IVendor.hal"
        "types.hal"
    ];
    interfaces = [
        "android.hardware.tests.baz@1.0"
        "android.hidl.base@1.0"
    ];
    gen_java = true;
    gen_java_constants = true;

    #  tests that license is copied
    notice = "FAKE_NOTICE_FILE";

    #  test apex_available resolves
    apex_available = [
        "//apex_available:anyapex"
        "//apex_available:platform"
    ];
};

in { inherit "hidl.tests.vendor@1.0"; }
