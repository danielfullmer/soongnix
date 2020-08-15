{ cc_library, cc_test }:
let

libarm-optimized-routines = cc_library {
    name = "libarm-optimized-routines";
    host_supported = true;
    recovery_available = true;
    cflags = [
        "-Werror"
        "-O2"
        "-DWANT_ROUNDING=0"
        "-DWANT_ERRNO=0"
        "-DFLT_EVAL_METHOD=0"
        "-ffp-contract=fast"
    ];
    srcs = [
        "math/cosf.c"
        "math/exp2.c"
        "math/exp2f.c"
        "math/exp2f_data.c"
        "math/exp.c"
        "math/exp_data.c"
        "math/expf.c"
        "math/log2.c"
        "math/log2_data.c"
        "math/log2f.c"
        "math/log2f_data.c"
        "math/log.c"
        "math/log_data.c"
        "math/logf.c"
        "math/logf_data.c"
        "math/math_err.c"
        "math/math_errf.c"
        "math/pow.c"
        "math/pow_log_data.c"
        "math/powf.c"
        "math/powf_log2_data.c"
        "math/sincosf.c"
        "math/sincosf_data.c"
        "math/sinf.c"
    ];

    #  arch-specific settings
    arch = {
        arm64 = {
            cflags = [
                "-DHAVE_FAST_FMA=1"
            ];
        };
    };

    target = {
        darwin = {
            enabled = false;
        };
        linux_bionic = {
            enabled = true;
        };
    };
    stl = "none";
    static = {
        system_shared_libs = [];
    };
};

#  adb shell "/data/nativetest64/mathtest/mathtest /data/nativetest64/mathtest/test/testcases/directed/*"
#  adb shell "/data/nativetest/mathtest/mathtest /data/nativetest/mathtest/test/testcases/directed/*"
mathtest = cc_test {
    name = "mathtest";
    gtest = false;
    host_supported = true;
    cflags = [
        "-Werror"
        "-Wno-missing-braces"
    ];
    srcs = [
        "math/single/e_rem_pio2.c"
        "test/mathtest.c"
    ];
    data = [
        "test/testcases/directed/cosf.tst"
        "test/testcases/directed/exp.tst"
        "test/testcases/directed/exp2.tst"
        "test/testcases/directed/exp2f.tst"
        "test/testcases/directed/expf.tst"
        "test/testcases/directed/log.tst"
        "test/testcases/directed/log2.tst"
        "test/testcases/directed/log2f.tst"
        "test/testcases/directed/logf.tst"
        "test/testcases/directed/pow.tst"
        "test/testcases/directed/powf.tst"
        "test/testcases/directed/rred.tst"
        "test/testcases/directed/rred2.tst"
        "test/testcases/directed/rred3.tst"
        "test/testcases/directed/rred4.tst"
        "test/testcases/directed/rred5.tst"
        "test/testcases/directed/sincosf.tst"
        "test/testcases/directed/sinf.tst"
    ];
    local_include_dirs = ["math/include"];
    target = {
        darwin = {
            enabled = false;
        };
        linux_bionic = {
            enabled = true;
        };
    };
};

in { inherit libarm-optimized-routines mathtest; }
