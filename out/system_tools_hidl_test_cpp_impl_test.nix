{ cc_test_library, genrule }:
let

hidl_cpp_impl_test_gen-headers = genrule {
    name = "hidl_cpp_impl_test_gen-headers";
    tools = [
        "hidl-gen"
    ];
    required = [
        "android.hardware.tests.foo@1.0"
        "hidl.tests.vendor.android@1.0"
    ];
    cmd = "$(location hidl-gen) -o $(genDir) -Lc++-impl-headers android.hardware.tests.foo@1.0 && " +
        "$(location hidl-gen) -o $(genDir) -r hidl.tests:system/tools/hidl/test/ " +
        "-Lc++-impl-headers hidl.tests.vendor.android@1.0";
    out = [
        "FooCallback.h"
        "Foo.h"
        "MyTypes.h"
        "Simple.h"
        "TheirTypes.h"
        "Vendor.h"
    ];
};

hidl_cpp_impl_test_gen-sources = genrule {
    name = "hidl_cpp_impl_test_gen-sources";
    tools = [
        "hidl-gen"
    ];
    required = [
        "android.hardware.tests.foo@1.0"
        "hidl.tests.vendor.android@1.0"
    ];
    cmd = "$(location hidl-gen) -o $(genDir) -Lc++-impl-sources android.hardware.tests.foo@1.0 && " +
        "$(location hidl-gen) -o $(genDir) -r hidl.tests:system/tools/hidl/test/ " +
        "-Lc++-impl-sources hidl.tests.vendor.android@1.0";
    out = [
        "FooCallback.cpp"
        "Foo.cpp"
        "MyTypes.cpp"
        "Simple.cpp"
        "TheirTypes.cpp"
        "Vendor.cpp"
    ];
};

hidl_cpp_impl_test = cc_test_library {
    name = "hidl_cpp_impl_test";
    generated_sources = ["hidl_cpp_impl_test_gen-sources"];
    generated_headers = ["hidl_cpp_impl_test_gen-headers"];
    shared_libs = [
        "libhidlbase"
        "libutils"
        "android.hardware.tests.foo@1.0"
        "hidl.tests.vendor.android@1.0"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit hidl_cpp_impl_test hidl_cpp_impl_test_gen-headers hidl_cpp_impl_test_gen-sources; }
