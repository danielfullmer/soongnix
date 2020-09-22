{ java_test_helper_library }:
let

compatibility-host-provider-preconditions = java_test_helper_library {
    name = "compatibility-host-provider-preconditions";
    srcs = ["src/android/provider/cts/preconditions/ExternalStoragePreparer.java"];
    libs = [
        "compatibility-host-util"
        "cts-tradefed"
        "tradefed"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    host_supported = true;
    device_supported = false;
};

in { inherit compatibility-host-provider-preconditions; }
