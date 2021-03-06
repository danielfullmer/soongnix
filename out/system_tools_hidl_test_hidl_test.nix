{ cc_defaults, cc_test }:
let

hidl_test_client-defaults = cc_defaults {
    name = "hidl_test_client-defaults";
    defaults = ["hidl-gen-defaults"];

    shared_libs = [
        "android.hidl.memory@1.0"
        "android.hidl.memory.token@1.0"
        "android.hidl.token@1.0"
        "libbase"
        "libcutils"
        "libhidlbase"
        "libhidlmemory"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libutils"
    ];

    #  Allow dlsym'ing self for statically linked passthrough implementations
    ldflags = ["-rdynamic"];

    #  These are static libs only for testing purposes and portability. Shared
    #  libs should be used on device.
    static_libs = [
        "libfootest"
        "libhidl-gen-utils"
        "libpointertest"
        "android.hardware.tests.expression@1.0"
        "android.hardware.tests.foo@1.0"
        "android.hardware.tests.bar@1.0"
        "android.hardware.tests.baz@1.0"
        "android.hardware.tests.hash@1.0"
        "android.hardware.tests.inheritance@1.0"
        "android.hardware.tests.pointer@1.0"
        "android.hardware.tests.memory@1.0"
        "android.hardware.tests.multithread@1.0"
        "android.hardware.tests.trie@1.0"
        "android.hardware.tests.safeunion.cpp@1.0"
        "android.hardware.tests.safeunion@1.0"
    ];

    #  impls should never be static, these are used only for testing purposes
    #  and test portability since this test pairs with specific hal
    #  implementations
    whole_static_libs = [
        "android.hardware.tests.foo@1.0-impl"
        "android.hardware.tests.bar@1.0-impl"
        "android.hardware.tests.baz@1.0-impl"
        "android.hardware.tests.hash@1.0-impl"
        "android.hardware.tests.inheritance@1.0-impl"
        "android.hardware.tests.pointer@1.0-impl"
        "android.hardware.tests.memory@1.0-impl"
        "android.hardware.tests.multithread@1.0-impl"
        "android.hardware.tests.trie@1.0-impl"
        "android.hardware.tests.safeunion.cpp@1.0-impl"
        "android.hardware.tests.safeunion@1.0-impl"
    ];

    group_static_libs = true;
};

hidl_test_client = cc_test {
    name = "hidl_test_client";
    defaults = ["hidl_test_client-defaults"];

    srcs = [
        "hidl_test_client.cpp"
        "FooCallback.cpp"
        "static_test.cpp"
    ];

    shared_libs = [
        "android.hidl.allocator@1.0"
    ];
};

hidl_test_servers = cc_test {
    name = "hidl_test_servers";
    defaults = ["hidl_test_client-defaults"];
    srcs = ["hidl_test_servers.cpp"];
    gtest = false;
};

in { inherit hidl_test_client hidl_test_client-defaults hidl_test_servers; }
