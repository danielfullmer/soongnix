{ cc_defaults, cc_library, cc_test, sh_test }:
let

arm-optimized-routines-defaults = cc_defaults {
    name = "arm-optimized-routines-defaults";
    host_supported = true;
    cflags = [
        "-Werror"
        "-Wno-unused-parameter"
        "-O2"
        "-ffp-contract=fast"
        "-fno-math-errno"

        #  bionic configuration.

        #  We're actually implementing bionic here, so we don't want <math.h>
        #  to try to be helpful by renaming long double routines.
        "-D__BIONIC_LP32_USE_LONG_DOUBLE"
        "-DFLT_EVAL_METHOD=0"

        #  arm-optimized-routines configuration.

        #  BSD libm doesn't set errno, and bionic was based on the BSDs.
        #  https://github.com/ARM-software/optimized-routines/issues/16#issuecomment-572009659
        "-DWANT_ERRNO=0"
        #  TODO: we may want the vector code in future, but it's not ready yet.
        "-DWANT_VMATH=0"
    ];
    local_include_dirs = ["math/include"];
};

libarm-optimized-routines-math = cc_library {
    name = "libarm-optimized-routines-math";
    defaults = ["arm-optimized-routines-defaults"];
    ramdisk_available = true;
    recovery_available = true;
    native_bridge_supported = true;
    srcs = [
        "math/cosf.c"
        "math/exp.c"
        "math/exp2.c"
        "math/exp2f.c"
        "math/exp2f_data.c"
        "math/exp_data.c"
        "math/expf.c"
        "math/log.c"
        "math/log2.c"
        "math/log2_data.c"
        "math/log2f.c"
        "math/log2f_data.c"
        "math/log_data.c"
        "math/logf.c"
        "math/logf_data.c"
        "math/math_err.c"
        "math/math_errf.c"
        "math/pow.c"
        "math/pow_log_data.c"
        "math/powf.c"
        "math/powf_log2_data.c"
        "math/s_cos.c"
        "math/s_cosf.c"
        "math/s_exp.c"
        "math/s_exp2f.c"
        "math/s_exp2f_1u.c"
        "math/s_expf.c"
        "math/s_expf_1u.c"
        "math/s_log.c"
        "math/s_logf.c"
        "math/s_pow.c"
        "math/s_powf.c"
        "math/s_sin.c"
        "math/s_sinf.c"
        "math/sincosf.c"
        "math/sincosf_data.c"
        "math/sinf.c"
        "math/v_cos.c"
        "math/v_cosf.c"
        "math/v_exp.c"
        "math/v_exp2f.c"
        "math/v_exp2f_1u.c"
        "math/v_exp_data.c"
        "math/v_expf.c"
        "math/v_expf_1u.c"
        "math/v_log.c"
        "math/v_log_data.c"
        "math/v_logf.c"
        "math/v_pow.c"
        "math/v_powf.c"
        "math/v_sin.c"
        "math/v_sinf.c"
        "math/vn_cos.c"
        "math/vn_cosf.c"
        "math/vn_exp.c"
        "math/vn_exp2f.c"
        "math/vn_exp2f_1u.c"
        "math/vn_expf.c"
        "math/vn_expf_1u.c"
        "math/vn_log.c"
        "math/vn_logf.c"
        "math/vn_pow.c"
        "math/vn_powf.c"
        "math/vn_sin.c"
        "math/vn_sinf.c"
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
    defaults = ["arm-optimized-routines-defaults"];
    gtest = false;
    cflags = ["-Wno-missing-braces"];
    srcs = ["math/test/mathtest.c"];
    data = [
        "math/test/testcases/directed/cosf.tst"
        "math/test/testcases/directed/exp.tst"
        "math/test/testcases/directed/exp2.tst"
        "math/test/testcases/directed/exp2f.tst"
        "math/test/testcases/directed/expf.tst"
        "math/test/testcases/directed/log.tst"
        "math/test/testcases/directed/log2.tst"
        "math/test/testcases/directed/log2f.tst"
        "math/test/testcases/directed/logf.tst"
        "math/test/testcases/directed/pow.tst"
        "math/test/testcases/directed/powf.tst"
        "math/test/testcases/directed/sincosf.tst"
        "math/test/testcases/directed/sinf.tst"
    ];
    target = {
        darwin = {
            enabled = false;
        };
        linux_bionic = {
            enabled = true;
        };
    };
};

ulp = cc_test {
    name = "ulp";
    defaults = ["arm-optimized-routines-defaults"];
    gtest = false;
    srcs = ["math/test/ulp.c"];
    data = ["math/test/runulp.sh"];
};

arm-optimized-routines-tests = sh_test {
    name = "arm-optimized-routines-tests";
    src = "run-arm-optimized-routines-tests-on-android.sh";
    filename = "run-arm-optimized-routines-tests-on-android.sh";
    test_suites = ["general-tests"];
    host_supported = true;
    device_supported = false;
    test_config = "arm-optimized-routines-tests.xml";
    target_required = [
        "mathtest"
        "ulp"
    ];
};

in { inherit arm-optimized-routines-defaults arm-optimized-routines-tests libarm-optimized-routines-math mathtest ulp; }
