{ bootstrap_go_package, cc_defaults, fluoride_defaults }:
let

soong-fluoride = bootstrap_go_package {
    name = "soong-fluoride";
    pkgPath = "android/soong/fluoride";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "soong"
        "soong-android"
        "soong-cc"
    ];
    srcs = [
        "fluoride.go"
    ];
    pluginFor = ["soong_build"];
};

libchrome_support_defaults = fluoride_defaults {
    name = "libchrome_support_defaults";
    shared_libs = ["libchrome"];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

fluoride_types_defaults = fluoride_defaults {
    name = "fluoride_types_defaults";
    defaults = ["libchrome_support_defaults"];
    cflags = [
        "-DEXPORT_SYMBOL=__attribute__((visibility(\"default\")))"
        "-fvisibility=hidden"
        #  struct BT_HDR is defined as a variable-size header in a struct.
        "-Wno-gnu-variable-sized-type-not-at-end"
        #  there are too many unused parameters in all the code.
        "-Wno-unused-parameter"
        "-DLOG_NDEBUG=1"
    ];
    conlyflags = [
        "-std=c99"
    ];
    product_variables = {
        debuggable = {
            cflags = [
                "-DBLUEDROID_DEBUG"
            ];
        };
    };
};

fluoride_defaults = fluoride_defaults {
    name = "fluoride_defaults";
    target = {
        android = {
            test_config_template = ":BluetoothTestConfigTemplate";
        };
    };
    defaults = ["fluoride_types_defaults"];
    header_libs = ["libbluetooth_headers"];
    shared_libs = ["libstatslog"];
    static_libs = [
        "libbluetooth-types"
        "libbt-platform-protos-lite"
    ];
    cpp_std = "c++17";
    sanitize = {
        misc_undefined = ["bounds"];
    };
};

#  Enables code coverage for a set of source files. Must be combined with
#  "clang_coverage_bin" in order to work. See //test/gen_coverage.py for more information
#  on generating code coverage.
clang_file_coverage = cc_defaults {
    name = "clang_file_coverage";
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
clang_coverage_bin = cc_defaults {
    name = "clang_coverage_bin";
    target = {
        host = {
            ldflags = [
                "-fprofile-instr-generate"
                "-fcoverage-mapping"
            ];
        };
    };
};

in { inherit clang_coverage_bin clang_file_coverage fluoride_defaults fluoride_types_defaults libchrome_support_defaults soong-fluoride; }
