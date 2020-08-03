{ cc_test_library, genrule }:
let

hidl_export_test_gen-headers = genrule {
    name = "hidl_export_test_gen-headers";
    tools = [
        "hidl-gen"
    ];
    srcs = [
        "1.0/IFoo.hal"
        "1.0/types.hal"
    ];
    cmd = "$(location hidl-gen) -o $(genDir)/export-base.h -Lexport-header " +
        "-rexport:system/tools/hidl/test/export_test export@1.0";
    out = [
        "export-base.h"
    ];
};

hidl_export_test = cc_test_library {
    name = "hidl_export_test";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    generated_headers = ["hidl_export_test_gen-headers"];
    srcs = ["test.cpp"];
};

in { inherit hidl_export_test hidl_export_test_gen-headers; }
