{ cc_prebuilt_library_shared, java_import }:
let

libLLVM_android = cc_prebuilt_library_shared {
    name = "libLLVM_android";
    vendor_available = true;
    host_supported = true;
    target = {
        linux_glibc_x86_64 = {
            srcs = ["linux/lib64/libLLVM_android.so"];
        };
        darwin_x86_64 = {
            srcs = ["darwin/lib64/libLLVM_android.dylib"];
        };
        #  TODO(ccross): this is necessary because the prebuilt module must have
        #  all the variants that are in the source module.  Ideally Soong's
        #  arch mutator should handle this.
        windows = {
            enabled = true;
        };
    };
};

libclang_android = cc_prebuilt_library_shared {
    name = "libclang_android";
    host_supported = true;
    target = {
        linux_glibc_x86_64 = {
            srcs = ["linux/lib64/libclang_android.so"];
        };
        darwin_x86_64 = {
            srcs = ["darwin/lib64/libclang_android.dylib"];
        };
        #  TODO(ccross): this is necessary because the prebuilt module must have
        #  all the variants that are in the source module.  Ideally Soong's
        #  arch mutator should handle this.
        windows = {
            enabled = true;
        };
    };
};

sdk-core-lambda-stubs = java_import {
    name = "sdk-core-lambda-stubs";
    jars = ["core-lambda-stubs.jar"];
};

in { inherit libLLVM_android libclang_android sdk-core-lambda-stubs; }
