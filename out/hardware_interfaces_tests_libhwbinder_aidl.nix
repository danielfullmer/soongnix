{ cc_library }:
let

"android.hardware.tests.libbinder" = cc_library {
    name = "android.hardware.tests.libbinder";
    defaults = ["hidl_defaults"];

    srcs = ["android/tests/binder/IBenchmark.aidl"];

    aidl = {
        export_aidl_headers = true;
    };

    shared_libs = [
        "libbinder"
        "libutils"
    ];

};

in { inherit "android.hardware.tests.libbinder"; }
