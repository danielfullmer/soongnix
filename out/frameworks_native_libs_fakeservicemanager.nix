{ cc_defaults, cc_library, cc_test_host }:
let

fakeservicemanager_defaults = cc_defaults {
    name = "fakeservicemanager_defaults";
    srcs = [
        "ServiceManager.cpp"
    ];

    shared_libs = [
        "libbinder"
        "libutils"
    ];
};

libfakeservicemanager = cc_library {
    name = "libfakeservicemanager";
    defaults = ["fakeservicemanager_defaults"];
};

fakeservicemanager_test = cc_test_host {
    name = "fakeservicemanager_test";
    defaults = ["fakeservicemanager_defaults"];
    srcs = [
        "test_sm.cpp"
    ];
    static_libs = ["libgmock"];
};

in { inherit fakeservicemanager_defaults fakeservicemanager_test libfakeservicemanager; }
