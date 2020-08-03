{ cc_defaults, cc_library_headers }:
let

#  Do not use directly. Use the defaults below.
jni_gtest_headers = cc_library_headers {
    name = "jni_gtest_headers";
    host_supported = true;
    export_include_dirs = ["base"];
};

jni_gtest_defaults = cc_defaults {
    name = "jni_gtest_defaults";
    header_libs = ["jni_gtest_headers"];
    shared_libs = ["libnativehelper"];
};

in { inherit jni_gtest_defaults jni_gtest_headers; }
