{ cc_defaults, cc_test }:
let

libmedia_ecoservice_tests_defaults = cc_defaults {
    name = "libmedia_ecoservice_tests_defaults";
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

EcoDataTest = cc_test {
    name = "EcoDataTest";
    defaults = ["libmedia_ecoservice_tests_defaults"];
    srcs = ["EcoDataTest.cpp"];
    shared_libs = [
        "libbinder"
        "libcutils"
        "libutils"
        "liblog"
        "libmedia_ecoservice"
    ];
};

EcoSessionTest = cc_test {
    name = "EcoSessionTest";
    defaults = ["libmedia_ecoservice_tests_defaults"];
    srcs = [
        "EcoSessionTest.cpp"
        "FakeECOServiceStatsProvider.cpp"
        "FakeECOServiceInfoListener.cpp"
    ];

    shared_libs = [
        "libbinder"
        "libcutils"
        "libutils"
        "liblog"
        "libmedia_ecoservice"
    ];
};

EcoServiceTest = cc_test {
    name = "EcoServiceTest";
    vendor = true;
    defaults = ["libmedia_ecoservice_tests_defaults"];
    srcs = [
        "EcoServiceTest.cpp"
        "FakeECOServiceStatsProvider.cpp"
        "FakeECOServiceInfoListener.cpp"
    ];

    shared_libs = [
        "libbinder"
        "libcutils"
        "libutils"
        "liblog"
        "libmedia_ecoservice"
    ];
};

in { inherit EcoDataTest EcoServiceTest EcoSessionTest libmedia_ecoservice_tests_defaults; }
