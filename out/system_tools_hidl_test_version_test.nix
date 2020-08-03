{ cc_test_host, genrule }:
let

hidl_hash_version_gen = genrule {
    name = "hidl_hash_version_gen";
    tools = [
        "hidl-gen"
    ];
    cmd = "$(location hidl-gen) -L check " +
        "    -r test.version:system/tools/hidl/test/version_test/good" +
        "    test.version.version@1.0" +
        "    test.version.version@2.2" +
        "    test.version.version@2.3" +
        "    test.version.version@2.4" +
        "    test.version.version@2.5" +
        "    test.version.version@3.0" +
        "    test.version.version@3.1" +
        "&&" +
        "($(location hidl-gen) -L check " +
        "    -r test.version:system/tools/hidl/test/version_test/bad1" +
        "    test.version.version@2.3 2>&1 | grep \"Cannot enforce minor version\" > /dev/null)" +
        "&&" +
        "($(location hidl-gen) -L check " +
        "    -r test.version:system/tools/hidl/test/version_test/bad2" +
        "    test.version.version@2.4 2>&1 | grep \"Cannot enforce minor version\" > /dev/null)" +
        "&&" +
        "($(location hidl-gen) -L check " +
        "    -r test.version:system/tools/hidl/test/version_test/bad3" +
        "    test.version.version@2.5 2>&1 | grep \"Cannot enforce minor version\" > /dev/null)" +
        "&&" +
        "($(location hidl-gen) -L check " +
        "    -r test.version:system/tools/hidl/test/version_test/bad4" +
        "    test.version.version@2.3 2>&1 | grep \"doesn't pass minor version\" > /dev/null)" +
        "&&" +
        "($(location hidl-gen) -L check " +
        "    -r test.version:system/tools/hidl/test/version_test/bad5" +
        "    test.version.version@2.3 2>&1 | grep \"doesn't pass minor version\" > /dev/null)" +
        "&&" +
        "echo 'int main(){return 0;}' > $(genDir)/TODO_b_37575883.cpp";
    out = ["TODO_b_37575883.cpp"];

    srcs = [
        "bad1/version/1.0/IFoo.hal"
        "bad1/version/2.2/IBar.hal"
        "bad1/version/2.3/IBar.hal"
        "bad2/version/2.2/IBar.hal"
        "bad2/version/2.3/IBar.hal"
        "bad2/version/2.4/IBar.hal"
        "bad3/version/2.2/IBar.hal"
        "bad3/version/2.2/IFoo.hal"
        "bad3/version/2.3/IBar.hal"
        "bad3/version/2.4/IBar.hal"
        "bad3/version/2.4/IFoo.hal"
        "bad3/version/2.5/IBar.hal"
        "bad3/version/2.5/IFoo.hal"
        "bad4/version/1.0/IFoo.hal"
        "bad4/version/2.2/IBar.hal"
        "bad4/version/2.2/IFoo.hal"
        "bad4/version/2.3/IBaz.hal"
        "bad5/version/2.2/IFoo.hal"
        "bad5/version/2.3/IBaz.hal"
        "good/version/1.0/IFoo.hal"
        "good/version/2.2/IBar.hal"
        "good/version/2.2/IFoo.hal"
        "good/version/2.3/IBar.hal"
        "good/version/2.3/IBaz.hal"
        "good/version/2.4/IBar.hal"
        "good/version/2.4/IFoo.hal"
        "good/version/2.5/IBar.hal"
        "good/version/2.5/IFoo.hal"
        "good/version/3.0/types.hal"
        "good/version/3.1/ICanExtendTypesOnly.hal"
        "good/version/3.1/types.hal"
    ];
};

hidl_version_test = cc_test_host {
    name = "hidl_version_test";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    generated_sources = ["hidl_hash_version_gen"];
};

in { inherit hidl_hash_version_gen hidl_version_test; }
