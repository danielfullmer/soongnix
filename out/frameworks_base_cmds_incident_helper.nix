{ cc_binary, cc_defaults, cc_test }:
let

incident_helper_defaults = cc_defaults {
    name = "incident_helper_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-g"
        "-O0"
    ];

    local_include_dirs = [
        "src/"
        "src/parsers/"
    ];

    srcs = [
        "src/parsers/*.cpp"
        "src/TextParserBase.cpp"
        "src/ih_util.cpp"
    ];

    generated_headers = ["gen-platform-proto-constants"];

    shared_libs = [
        "libbase"
        "liblog"
        "libprotoutil"
        "libutils"
    ];
};

incident_helper = cc_binary {
    name = "incident_helper";
    defaults = ["incident_helper_defaults"];
    srcs = ["src/main.cpp"];
};

incident_helper_test = cc_test {
    name = "incident_helper_test";
    test_suites = ["device-tests"];
    defaults = ["incident_helper_defaults"];
    local_include_dirs = ["src/"];

    srcs = [
        "tests/*.cpp"
    ];

    data = [
        "testdata/*"
    ];

    static_libs = [
        "libgmock"
        "libplatformprotos"
    ];

    shared_libs = [
        "libprotobuf-cpp-full"
    ];
    proto = {
        type = "full";
    };
};

in { inherit incident_helper incident_helper_defaults incident_helper_test; }
