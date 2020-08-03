{ cc_test_host, genrule }:
let

hidl_error_test_gen = genrule {
    name = "hidl_error_test_gen";
    tools = ["hidl-gen"];
    tool_files = ["hidl_error_test.sh"];
    cmd = "$(location hidl_error_test.sh) $(location hidl-gen) &&" +
        "echo 'int main(){return 0;}' > $(genDir)/TODO_b_37575883.cpp";
    out = ["TODO_b_37575883.cpp"];
    srcs = [
        "**/*.hal"
        "**/required_error"
    ];
};

hidl_error_test = cc_test_host {
    name = "hidl_error_test";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    generated_sources = ["hidl_error_test_gen"];
};

in { inherit hidl_error_test hidl_error_test_gen; }
