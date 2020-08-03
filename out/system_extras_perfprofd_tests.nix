{ cc_defaults, cc_test }:
let

#  Build the unit tests.

perfprofd_test_defaults = cc_defaults {
    name = "perfprofd_test_defaults";
    defaults = [
        "libartd_static_defaults"
        "perfprofd_defaults"
        "perfprofd_debug_defaults"
    ];

    strip = {
        keep_symbols = true;
    };
};

#
#  Unit test for perfprofd
#
perfprofd_test = cc_test {
    name = "perfprofd_test";
    defaults = [
        "perfprofd_test_defaults"
        "libsimpleperf_dex_read_static_reqs_defaults"
        "libsimpleperf_elf_read_static_reqs_defaults"
    ];
    test_suites = ["device-tests"];
    host_supported = true;

    stl = "libc++";
    static_libs = [
        "libperfprofdcored"
        "libperfprofd_proto_config"
        "libsimpleperf_dex_read"
        "libsimpleperf_elf_read"
        "libbase"
        "libutils"
        "libz"
        "libprotobuf-cpp-lite"
        "liblog"
    ];
    target = {
        host = {
            host_ldlibs = [
                "-lncurses"
            ];
        };

        #  The live tests require simpleperf.
        android = {
            required = [
                "simpleperf"
            ];
            static_libs = [
                "libhealthhalutils"
            ];
            shared_libs = [
                "android.hardware.health@2.0"
                "libbinder"
                "libhidlbase"
                "libservices"
                "libutils"
            ];
        };

    };
    srcs = [
        "perfprofd_test.cc"
    ];
    data = [
        "canned.perf.data"
        "callchain.canned.perf.data"
    ];
};

in { inherit perfprofd_test perfprofd_test_defaults; }
