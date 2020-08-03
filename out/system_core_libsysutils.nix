{ cc_library, cc_test }:
let

libsysutils = cc_library {
    name = "libsysutils";
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    srcs = [
        "src/SocketListener.cpp"
        "src/FrameworkListener.cpp"
        "src/NetlinkListener.cpp"
        "src/NetlinkEvent.cpp"
        "src/FrameworkCommand.cpp"
        "src/SocketClient.cpp"
        "src/ServiceManager.cpp"
    ];

    logtags = ["EventLogTags.logtags"];

    cflags = ["-Werror"];

    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
    ];

    export_include_dirs = ["include"];
};

libsysutils_tests = cc_test {
    name = "libsysutils_tests";
    test_suites = ["device-tests"];
    srcs = [
        "src/SocketListener_test.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libsysutils"
    ];
};

in { inherit libsysutils libsysutils_tests; }
