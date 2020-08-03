{ cc_library, cc_test }:
let

libnetdutils = cc_library {
    name = "libnetdutils";
    srcs = [
        "DumpWriter.cpp"
        "Fd.cpp"
        "InternetAddresses.cpp"
        "Log.cpp"
        "Netfilter.cpp"
        "Netlink.cpp"
        "Slice.cpp"
        "Socket.cpp"
        "SocketOption.cpp"
        "Status.cpp"
        "Syscalls.cpp"
        "UniqueFd.cpp"
        "UniqueFile.cpp"
    ];
    defaults = ["netd_defaults"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    export_shared_lib_headers = [
        "libbase"
    ];
    export_include_dirs = ["include"];
};

netdutils_test = cc_test {
    name = "netdutils_test";
    srcs = [
        "BackoffSequenceTest.cpp"
        "FdTest.cpp"
        "InternetAddressesTest.cpp"
        "LogTest.cpp"
        "MemBlockTest.cpp"
        "OperationLimiterTest.cpp"
        "SliceTest.cpp"
        "StatusTest.cpp"
        "SyscallsTest.cpp"
        "ThreadUtilTest.cpp"
    ];
    defaults = ["netd_defaults"];
    test_suites = ["device-tests"];
    static_libs = [
        "libgmock"
        "libnetdutils"
    ];
    shared_libs = [
        "libbase"
    ];
};

in { inherit libnetdutils netdutils_test; }
