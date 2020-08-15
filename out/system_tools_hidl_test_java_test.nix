{ cc_test, java_test }:
let

hidl_test_java_native = cc_test {
    name = "hidl_test_java_native";
    srcs = ["hidl_test_java_native.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    #  Allow dlsym'ing self for statically linked passthrough implementations
    ldflags = ["-rdynamic"];

    shared_libs = [
        "libbase"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libutils"
    ];

    static_libs = [
        "android.hardware.tests.baz@1.0"
        "android.hardware.tests.expression@1.0"
        "android.hardware.tests.inheritance@1.0"
        "android.hardware.tests.safeunion@1.0"
    ];

    #  impls should never be static, these are used only for testing purposes
    #  and test portability since this test pairs with specific hal
    #  implementations
    whole_static_libs = [
        "android.hardware.tests.baz@1.0-impl"
        "android.hardware.tests.safeunion@1.0-impl"
    ];

    compile_multilib = "both";
};

hidl_test_java_java = java_test {
    name = "hidl_test_java_java";
    srcs = ["src/com/android/commands/hidl_test_java/HidlTestJava.java"];

    static_libs = [
        "android.hidl.manager-V1.0-java"
        "android.hardware.tests.baz-V1.0-java"
        "android.hardware.tests.expression-V1.0-java"
        "android.hardware.tests.inheritance-V1.0-java"
        "android.hardware.tests.safeunion-V1.0-java"
    ];
};

in { inherit hidl_test_java_java hidl_test_java_native; }
