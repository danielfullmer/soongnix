{ cc_test_host, genrule }:
let

hidl_hash_test_gen = genrule {
    name = "hidl_hash_test_gen";
    tools = [
        "hidl-gen"
    ];
    cmd = "$(location hidl-gen) -L check " +
        "    -r android.hidl:system/libhidl/transport" +
        "    -r test.hash:system/tools/hidl/test/hash_test/good" +
        "    test.hash.hash@1.0" +
        "&&" +
        "!($(location hidl-gen) -L check " +
        "    -r android.hidl:system/libhidl/transport" +
        "    -r test.hash:system/tools/hidl/test/hash_test/bad" +
        "    test.hash.hash@1.0 2> /dev/null)" +
        "&&" +
        "$(location hidl-gen) -L hash " +
        "    -r android.hidl:system/libhidl/transport" +
        "    -r test.hash:system/tools/hidl/test/hash_test/bad" +
        "    test.hash.hash@1.0 > /dev/null" +
        "&&" +
        "echo 'int main(){return 0;}' > $(genDir)/TODO_b_37575883.cpp";
    out = ["TODO_b_37575883.cpp"];

    srcs = [
        "bad/hash/1.0/IHash.hal"
        "bad/current.txt"
        "good/hash/1.0/IHash.hal"
        "good/current.txt"
    ];
};

hidl_hash_test = cc_test_host {
    name = "hidl_hash_test";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    generated_sources = ["hidl_hash_test_gen"];
};

in { inherit hidl_hash_test hidl_hash_test_gen; }
