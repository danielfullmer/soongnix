{ blueprint_go_binary }:
let

cuj_tests = blueprint_go_binary {
    name = "cuj_tests";
    deps = [
        "soong-ui-build"
        "soong-ui-logger"
        "soong-ui-terminal"
        "soong-ui-tracer"
    ];
    srcs = [
        "cuj.go"
    ];
};

in { inherit cuj_tests; }
