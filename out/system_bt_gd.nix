{ cc_benchmark, cc_defaults, cc_library, cc_test }:
let

gd_defaults = cc_defaults {
    name = "gd_defaults";
    target = {
        android = {
            test_config_template = "AndroidTestTemplate.xml";
            cflags = [
                "-DOS_ANDROID"
                "-DOS_LINUX_GENERIC"
            ];
            shared_libs = [
                "liblog"
            ];
        };
        host = {
            cflags = [
                "-DOS_LINUX"
                "-DOS_LINUX_GENERIC"
            ];
        };
    };
    cpp_std = "c++17";
    cflags = [
        "-DEXPORT_SYMBOL=__attribute__((visibility(\"default\")))"
        "-fvisibility=hidden"
        "-DLOG_NDEBUG=1"
        "-DGOOGLE_PROTOBUF_NO_RTTI"
    ];
    conlyflags = [
        "-std=c99"
    ];
    sanitize = {
        misc_undefined = ["bounds"];
    };
};

#  Enables code coverage for a set of source files. Must be combined with
#  "clang_coverage_bin" in order to work. See //test/gen_coverage.py for more information
#  on generating code coverage.
gd_clang_file_coverage = cc_defaults {
    name = "gd_clang_file_coverage";
    target = {
        host = {
            clang_cflags = [
                "-fprofile-instr-generate"
                "-fcoverage-mapping"
            ];
        };
    };
};

#  Enabled code coverage on a binary. These flags allow libraries that were
#  compiled with "clang_file_coverage" to be properly linked together in
#  order to create a binary that will create a profraw file when ran. Note
#  these flags themselves don't enable code coverage for the source files
#  compiled in the binary. See //test/gen_coverage.py for more information
#  on generating code coverage.
gd_clang_coverage_bin = cc_defaults {
    name = "gd_clang_coverage_bin";
    target = {
        host = {
            ldflags = [
                "-fprofile-instr-generate"
                "-fcoverage-mapping"
            ];
        };
    };
};

libbluetooth_gd = cc_library {
    name = "libbluetooth_gd";
    defaults = [
        "gd_defaults"
        "gd_clang_file_coverage"
    ];
    host_supported = true;
    target = {
        linux = {
            srcs = [
                ":BluetoothOsSources_linux_generic"
            ];
        };
    };
    srcs = [
        ":BluetoothCommonSources"
        ":BluetoothPacketSources"
    ];
};

bluetooth_test_gd = cc_test {
    name = "bluetooth_test_gd";
    test_suites = ["device-tests"];
    defaults = [
        "gd_defaults"
        "gd_clang_coverage_bin"
    ];
    host_supported = true;
    target = {
        linux = {
            srcs = [
                ":BluetoothOsTestSources_linux_generic"
            ];
        };
    };
    srcs = [
        ":BluetoothCommonTestSources"
        ":BluetoothPacketTestSources"
    ];
    static_libs = [
        "libbluetooth_gd"
    ];
    sanitize = {
        cfi = false;
    };
};

bluetooth_benchmark_gd = cc_benchmark {
    name = "bluetooth_benchmark_gd";
    defaults = ["gd_defaults"];
    host_supported = true;
    srcs = [
        "benchmark.cc"
        ":BluetoothOsBenchmarkSources"
    ];
    static_libs = [
        "libbluetooth_gd"
    ];
};

in { inherit bluetooth_benchmark_gd bluetooth_test_gd gd_clang_coverage_bin gd_clang_file_coverage gd_defaults libbluetooth_gd; }
