{ cc_test_library, genrule }:
let

hidl_impl_test_gen-headers = genrule {
    name = "hidl_impl_test_gen-headers";
    tools = [
        "hidl-gen"
    ];
    required = [
        "android.hardware.tests.foo@1.0"
    ];
    cmd = "$(location hidl-gen) -o $(genDir) -Lc++-impl-headers android.hardware.tests.foo@1.0";
    out = [
        "FooCallback.h"
        "Foo.h"
        "MyTypes.h"
        "Simple.h"
        "TheirTypes.h"
    ];
};

hidl_impl_test_gen-sources = genrule {
    name = "hidl_impl_test_gen-sources";
    tools = [
        "hidl-gen"
    ];
    required = [
        "android.hardware.tests.foo@1.0"
    ];
    cmd = "$(location hidl-gen) -o $(genDir) -Lc++-impl-sources android.hardware.tests.foo@1.0";
    out = [
        "FooCallback.cpp"
        "Foo.cpp"
        "MyTypes.cpp"
        "Simple.cpp"
        "TheirTypes.cpp"
    ];
};

hidl_impl_test = cc_test_library {
    name = "hidl_impl_test";
    generated_sources = ["hidl_impl_test_gen-sources"];
    generated_headers = ["hidl_impl_test_gen-headers"];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "android.hardware.tests.foo@1.0"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit hidl_impl_test hidl_impl_test_gen-headers hidl_impl_test_gen-sources; }
