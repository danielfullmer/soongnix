{ cc_library, cc_test }:
let

libpackagelistparser = cc_library {
    name = "libpackagelistparser";
    recovery_available = true;
    srcs = ["packagelistparser.cpp"];
    shared_libs = ["liblog"];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];

    sanitize = {
        misc_undefined = ["integer"];
    };
};

libpackagelistparser_test = cc_test {
    name = "libpackagelistparser_test";
    srcs = ["packagelistparser_test.cpp"];
    shared_libs = [
        "libbase"
        "libpackagelistparser"
    ];
    test_suites = ["device-tests"];
    require_root = true;
};

in { inherit libpackagelistparser libpackagelistparser_test; }
