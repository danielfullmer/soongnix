{ cc_test }:
let

audiopolicy_tests = cc_test {
    name = "audiopolicy_tests";

    include_dirs = [
        "frameworks/av/services/audiopolicy"
    ];

    shared_libs = [
        "libaudioclient"
        "libaudiofoundation"
        "libaudiopolicy"
        "libaudiopolicymanagerdefault"
        "libbase"
        "libhidlbase"
        "liblog"
        "libmedia_helper"
        "libutils"
        "libxml2"
    ];

    static_libs = ["libaudiopolicycomponents"];

    header_libs = [
        "libaudiopolicycommon"
        "libaudiopolicyengine_interface_headers"
        "libaudiopolicymanager_interface_headers"
    ];

    srcs = ["audiopolicymanager_tests.cpp"];

    data = [":audiopolicytest_configuration_files"];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    test_suites = ["device-tests"];

};

audio_health_tests = cc_test {
    name = "audio_health_tests";

    shared_libs = [
        "libaudiofoundation"
        "libaudioclient"
        "libaudiopolicymanagerdefault"
        "liblog"
        "libmedia_helper"
        "libutils"
    ];

    static_libs = ["libaudiopolicycomponents"];

    header_libs = [
        "libaudiopolicyengine_interface_headers"
        "libaudiopolicymanager_interface_headers"
    ];

    srcs = ["audio_health_tests.cpp"];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    test_suites = ["device-tests"];

};

in { inherit audio_health_tests audiopolicy_tests; }
