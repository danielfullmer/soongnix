{ cc_library, cc_test }:
let

libcn-cbor = cc_library {
    name = "libcn-cbor";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "src/cn-cbor.c"
        "src/cn-create.c"
        "src/cn-encoder.c"
        "src/cn-error.c"
        "src/cn-get.c"
    ];
    local_include_dirs = [
        "include"
    ];
    export_include_dirs = [
        "include"
    ];
    unique_host_soname = true;
    host_supported = true;
};

cn-cbor_test = cc_test {
    name = "cn-cbor_test";
    host_supported = true;
    srcs = [
        "test/cbor_test.c"
    ];
    shared_libs = ["libcn-cbor"];
};

in { inherit cn-cbor_test libcn-cbor; }
