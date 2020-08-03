{ blueprint_go_binary }:
let

diff_target_files = blueprint_go_binary {
    name = "diff_target_files";
    srcs = [
        "compare.go"
        "diff_target_files.go"
        "glob.go"
        "target_files.go"
        "whitelist.go"
        "zip_artifact.go"
    ];
    testSrcs = [
        "compare_test.go"
        "glob_test.go"
        "whitelist_test.go"
    ];
};

in { inherit diff_target_files; }
