{ cc_library, genrule }:
let

bionic_coverage = false;

#
#  libm.so and libm.a for target.
#
libm = cc_library {
    name = "libm";
    defaults = ["linux_bionic_supported"];
    recovery_available = true;
    static_ndk_lib = true;

    whole_static_libs = ["libarm-optimized-routines"];

    srcs = [
        "upstream-freebsd/lib/msun/bsdsrc/b_exp.c"
        "upstream-freebsd/lib/msun/bsdsrc/b_log.c"
        "upstream-freebsd/lib/msun/bsdsrc/b_tgamma.c"
        "upstream-freebsd/lib/msun/src/catrig.c"
        "upstream-freebsd/lib/msun/src/catrigf.c"
        "upstream-freebsd/lib/msun/src/e_acos.c"
        "upstream-freebsd/lib/msun/src/e_acosf.c"
        "upstream-freebsd/lib/msun/src/e_acosh.c"
        "upstream-freebsd/lib/msun/src/e_acoshf.c"
        "upstream-freebsd/lib/msun/src/e_asin.c"
        "upstream-freebsd/lib/msun/src/e_asinf.c"
        "upstream-freebsd/lib/msun/src/e_atan2.c"
        "upstream-freebsd/lib/msun/src/e_atan2f.c"
        "upstream-freebsd/lib/msun/src/e_atanh.c"
        "upstream-freebsd/lib/msun/src/e_atanhf.c"
        "upstream-freebsd/lib/msun/src/e_cosh.c"
        "upstream-freebsd/lib/msun/src/e_coshf.c"
        "upstream-freebsd/lib/msun/src/e_fmod.c"
        "upstream-freebsd/lib/msun/src/e_fmodf.c"
        "upstream-freebsd/lib/msun/src/e_gamma.c"
        "upstream-freebsd/lib/msun/src/e_gammaf.c"
        "upstream-freebsd/lib/msun/src/e_gammaf_r.c"
        "upstream-freebsd/lib/msun/src/e_gamma_r.c"
        "upstream-freebsd/lib/msun/src/e_hypot.c"
        "upstream-freebsd/lib/msun/src/e_hypotf.c"
        "upstream-freebsd/lib/msun/src/e_j0.c"
        "upstream-freebsd/lib/msun/src/e_j0f.c"
        "upstream-freebsd/lib/msun/src/e_j1.c"
        "upstream-freebsd/lib/msun/src/e_j1f.c"
        "upstream-freebsd/lib/msun/src/e_jn.c"
        "upstream-freebsd/lib/msun/src/e_jnf.c"
        "upstream-freebsd/lib/msun/src/e_lgamma.c"
        "upstream-freebsd/lib/msun/src/e_lgammaf.c"
        "upstream-freebsd/lib/msun/src/e_lgammaf_r.c"
        "upstream-freebsd/lib/msun/src/e_lgamma_r.c"
        "upstream-freebsd/lib/msun/src/e_log10.c"
        "upstream-freebsd/lib/msun/src/e_log10f.c"
        "upstream-freebsd/lib/msun/src/e_remainder.c"
        "upstream-freebsd/lib/msun/src/e_remainderf.c"
        "upstream-freebsd/lib/msun/src/e_rem_pio2.c"
        "upstream-freebsd/lib/msun/src/e_rem_pio2f.c"
        "upstream-freebsd/lib/msun/src/e_scalb.c"
        "upstream-freebsd/lib/msun/src/e_scalbf.c"
        "upstream-freebsd/lib/msun/src/e_sinh.c"
        "upstream-freebsd/lib/msun/src/e_sinhf.c"
        "upstream-freebsd/lib/msun/src/e_sqrt.c"
        "upstream-freebsd/lib/msun/src/e_sqrtf.c"
        "upstream-freebsd/lib/msun/src/k_cos.c"
        "upstream-freebsd/lib/msun/src/k_cosf.c"
        "upstream-freebsd/lib/msun/src/k_exp.c"
        "upstream-freebsd/lib/msun/src/k_expf.c"
        "upstream-freebsd/lib/msun/src/k_rem_pio2.c"
        "upstream-freebsd/lib/msun/src/k_sin.c"
        "upstream-freebsd/lib/msun/src/k_sinf.c"
        "upstream-freebsd/lib/msun/src/k_tan.c"
        "upstream-freebsd/lib/msun/src/k_tanf.c"
        "upstream-freebsd/lib/msun/src/s_asinh.c"
        "upstream-freebsd/lib/msun/src/s_asinhf.c"
        "upstream-freebsd/lib/msun/src/s_atan.c"
        "upstream-freebsd/lib/msun/src/s_atanf.c"
        "upstream-freebsd/lib/msun/src/s_carg.c"
        "upstream-freebsd/lib/msun/src/s_cargf.c"
        "upstream-freebsd/lib/msun/src/s_cargl.c"
        "upstream-freebsd/lib/msun/src/s_cbrt.c"
        "upstream-freebsd/lib/msun/src/s_cbrtf.c"
        "upstream-freebsd/lib/msun/src/s_ccosh.c"
        "upstream-freebsd/lib/msun/src/s_ccoshf.c"
        "upstream-freebsd/lib/msun/src/s_ceil.c"
        "upstream-freebsd/lib/msun/src/s_ceilf.c"
        "upstream-freebsd/lib/msun/src/s_cexp.c"
        "upstream-freebsd/lib/msun/src/s_cexpf.c"
        "upstream-freebsd/lib/msun/src/s_cimag.c"
        "upstream-freebsd/lib/msun/src/s_cimagf.c"
        "upstream-freebsd/lib/msun/src/s_cimagl.c"
        "upstream-freebsd/lib/msun/src/s_clog.c"
        "upstream-freebsd/lib/msun/src/s_clogf.c"
        "upstream-freebsd/lib/msun/src/s_conj.c"
        "upstream-freebsd/lib/msun/src/s_conjf.c"
        "upstream-freebsd/lib/msun/src/s_conjl.c"
        "upstream-freebsd/lib/msun/src/s_copysign.c"
        "upstream-freebsd/lib/msun/src/s_copysignf.c"
        "upstream-freebsd/lib/msun/src/s_cos.c"
        "upstream-freebsd/lib/msun/src/s_cpow.c"
        "upstream-freebsd/lib/msun/src/s_cpowf.c"
        "upstream-freebsd/lib/msun/src/s_cpowl.c"
        "upstream-freebsd/lib/msun/src/s_cproj.c"
        "upstream-freebsd/lib/msun/src/s_cprojf.c"
        "upstream-freebsd/lib/msun/src/s_cprojl.c"
        "upstream-freebsd/lib/msun/src/s_creal.c"
        "upstream-freebsd/lib/msun/src/s_crealf.c"
        "upstream-freebsd/lib/msun/src/s_creall.c"
        "upstream-freebsd/lib/msun/src/s_csinh.c"
        "upstream-freebsd/lib/msun/src/s_csinhf.c"
        "upstream-freebsd/lib/msun/src/s_csqrt.c"
        "upstream-freebsd/lib/msun/src/s_csqrtf.c"
        "upstream-freebsd/lib/msun/src/s_ctanh.c"
        "upstream-freebsd/lib/msun/src/s_ctanhf.c"
        "upstream-freebsd/lib/msun/src/s_erf.c"
        "upstream-freebsd/lib/msun/src/s_erff.c"
        "upstream-freebsd/lib/msun/src/s_expm1.c"
        "upstream-freebsd/lib/msun/src/s_expm1f.c"
        "upstream-freebsd/lib/msun/src/s_fdim.c"
        "upstream-freebsd/lib/msun/src/s_finite.c"
        "upstream-freebsd/lib/msun/src/s_finitef.c"
        "upstream-freebsd/lib/msun/src/s_floor.c"
        "upstream-freebsd/lib/msun/src/s_floorf.c"
        "upstream-freebsd/lib/msun/src/s_fma.c"
        "upstream-freebsd/lib/msun/src/s_fmaf.c"
        "upstream-freebsd/lib/msun/src/s_fmax.c"
        "upstream-freebsd/lib/msun/src/s_fmaxf.c"
        "upstream-freebsd/lib/msun/src/s_fmin.c"
        "upstream-freebsd/lib/msun/src/s_fminf.c"
        "upstream-freebsd/lib/msun/src/s_frexp.c"
        "upstream-freebsd/lib/msun/src/s_frexpf.c"
        "upstream-freebsd/lib/msun/src/s_ilogb.c"
        "upstream-freebsd/lib/msun/src/s_ilogbf.c"
        "upstream-freebsd/lib/msun/src/s_llrint.c"
        "upstream-freebsd/lib/msun/src/s_llrintf.c"
        "upstream-freebsd/lib/msun/src/s_llround.c"
        "upstream-freebsd/lib/msun/src/s_llroundf.c"
        "upstream-freebsd/lib/msun/src/s_log1p.c"
        "upstream-freebsd/lib/msun/src/s_log1pf.c"
        "upstream-freebsd/lib/msun/src/s_logb.c"
        "upstream-freebsd/lib/msun/src/s_logbf.c"
        "upstream-freebsd/lib/msun/src/s_lrint.c"
        "upstream-freebsd/lib/msun/src/s_lrintf.c"
        "upstream-freebsd/lib/msun/src/s_lround.c"
        "upstream-freebsd/lib/msun/src/s_lroundf.c"
        "upstream-freebsd/lib/msun/src/s_modf.c"
        "upstream-freebsd/lib/msun/src/s_modff.c"
        "upstream-freebsd/lib/msun/src/s_nan.c"
        "upstream-freebsd/lib/msun/src/s_nearbyint.c"
        "upstream-freebsd/lib/msun/src/s_nextafter.c"
        "upstream-freebsd/lib/msun/src/s_nextafterf.c"
        "upstream-freebsd/lib/msun/src/s_remquo.c"
        "upstream-freebsd/lib/msun/src/s_remquof.c"
        "upstream-freebsd/lib/msun/src/s_rint.c"
        "upstream-freebsd/lib/msun/src/s_rintf.c"
        "upstream-freebsd/lib/msun/src/s_round.c"
        "upstream-freebsd/lib/msun/src/s_roundf.c"
        "upstream-freebsd/lib/msun/src/s_scalbln.c"
        "upstream-freebsd/lib/msun/src/s_scalbn.c"
        "upstream-freebsd/lib/msun/src/s_scalbnf.c"
        "upstream-freebsd/lib/msun/src/s_signgam.c"
        "upstream-freebsd/lib/msun/src/s_significand.c"
        "upstream-freebsd/lib/msun/src/s_significandf.c"
        "upstream-freebsd/lib/msun/src/s_sin.c"
        "upstream-freebsd/lib/msun/src/s_sincos.c"
        "upstream-freebsd/lib/msun/src/s_tan.c"
        "upstream-freebsd/lib/msun/src/s_tanf.c"
        "upstream-freebsd/lib/msun/src/s_tanh.c"
        "upstream-freebsd/lib/msun/src/s_tanhf.c"
        "upstream-freebsd/lib/msun/src/s_tgammaf.c"
        "upstream-freebsd/lib/msun/src/s_trunc.c"
        "upstream-freebsd/lib/msun/src/s_truncf.c"
        "upstream-freebsd/lib/msun/src/w_cabs.c"
        "upstream-freebsd/lib/msun/src/w_cabsf.c"
        "upstream-freebsd/lib/msun/src/w_cabsl.c"
        "upstream-freebsd/lib/msun/src/w_drem.c"
        "upstream-freebsd/lib/msun/src/w_dremf.c"

        #  The FreeBSD complex functions appear to be better, but they're incomplete.
        #  We take the FreeBSD implementations when they exist, but fill out the rest
        #  of <complex.h> from NetBSD...
        "upstream-netbsd/lib/libm/complex/ccoshl.c"
        "upstream-netbsd/lib/libm/complex/ccosl.c"
        "upstream-netbsd/lib/libm/complex/cephes_subrl.c"
        "upstream-netbsd/lib/libm/complex/cexpl.c"
        "upstream-netbsd/lib/libm/complex/csinhl.c"
        "upstream-netbsd/lib/libm/complex/csinl.c"
        "upstream-netbsd/lib/libm/complex/ctanhl.c"
        "upstream-netbsd/lib/libm/complex/ctanl.c"

        #  TODO: this comes from from upstream's libc, not libm, but it's an
        #  implementation detail that should have hidden visibility, so it needs
        #  to be in whatever library the math code is in.
        "digittoint.c"

        #  Functionality not in the BSDs.
        "significandl.c"
        "fake_long_double.c"

        #  Home-grown stuff.
        "builtins.cpp"
        "signbit.cpp"
    ];

    multilib = {
        lib64 = {
            srcs = [
                "upstream-freebsd/lib/msun/src/catrigl.c"
                "upstream-freebsd/lib/msun/src/e_acosl.c"
                "upstream-freebsd/lib/msun/src/e_acoshl.c"
                "upstream-freebsd/lib/msun/src/e_asinl.c"
                "upstream-freebsd/lib/msun/src/e_atan2l.c"
                "upstream-freebsd/lib/msun/src/e_atanhl.c"
                "upstream-freebsd/lib/msun/src/e_fmodl.c"
                "upstream-freebsd/lib/msun/src/e_hypotl.c"
                "upstream-freebsd/lib/msun/src/e_lgammal.c"
                "upstream-freebsd/lib/msun/src/e_remainderl.c"
                "upstream-freebsd/lib/msun/src/e_sqrtl.c"
                "upstream-freebsd/lib/msun/src/s_asinhl.c"
                "upstream-freebsd/lib/msun/src/s_atanl.c"
                "upstream-freebsd/lib/msun/src/s_cbrtl.c"
                "upstream-freebsd/lib/msun/src/s_ceill.c"
                "upstream-freebsd/lib/msun/src/s_clogl.c"
                "upstream-freebsd/lib/msun/src/s_copysignl.c"
                "upstream-freebsd/lib/msun/src/e_coshl.c"
                "upstream-freebsd/lib/msun/src/s_cosl.c"
                "upstream-freebsd/lib/msun/src/s_csqrtl.c"
                "upstream-freebsd/lib/msun/src/s_floorl.c"
                "upstream-freebsd/lib/msun/src/s_fmal.c"
                "upstream-freebsd/lib/msun/src/s_fmaxl.c"
                "upstream-freebsd/lib/msun/src/s_fminl.c"
                "upstream-freebsd/lib/msun/src/s_modfl.c"
                "upstream-freebsd/lib/msun/src/s_frexpl.c"
                "upstream-freebsd/lib/msun/src/s_ilogbl.c"
                "upstream-freebsd/lib/msun/src/s_llrintl.c"
                "upstream-freebsd/lib/msun/src/s_llroundl.c"
                "upstream-freebsd/lib/msun/src/s_logbl.c"
                "upstream-freebsd/lib/msun/src/s_lrintl.c"
                "upstream-freebsd/lib/msun/src/s_lroundl.c"
                "upstream-freebsd/lib/msun/src/s_nextafterl.c"
                "upstream-freebsd/lib/msun/src/s_nexttoward.c"
                "upstream-freebsd/lib/msun/src/s_nexttowardf.c"
                "upstream-freebsd/lib/msun/src/s_remquol.c"
                "upstream-freebsd/lib/msun/src/s_rintl.c"
                "upstream-freebsd/lib/msun/src/s_roundl.c"
                "upstream-freebsd/lib/msun/src/s_scalbnl.c"
                "upstream-freebsd/lib/msun/src/s_sincosl.c"
                "upstream-freebsd/lib/msun/src/e_sinhl.c"
                "upstream-freebsd/lib/msun/src/s_sinl.c"
                "upstream-freebsd/lib/msun/src/s_tanhl.c"
                "upstream-freebsd/lib/msun/src/s_tanl.c"
                "upstream-freebsd/lib/msun/src/s_truncl.c"

                "upstream-freebsd/lib/msun/ld128/invtrig.c"
                "upstream-freebsd/lib/msun/ld128/e_lgammal_r.c"
                "upstream-freebsd/lib/msun/ld128/e_powl.c"
                "upstream-freebsd/lib/msun/ld128/k_cosl.c"
                "upstream-freebsd/lib/msun/ld128/k_sinl.c"
                "upstream-freebsd/lib/msun/ld128/k_tanl.c"
                "upstream-freebsd/lib/msun/ld128/s_erfl.c"
                "upstream-freebsd/lib/msun/ld128/s_exp2l.c"
                "upstream-freebsd/lib/msun/ld128/s_expl.c"
                "upstream-freebsd/lib/msun/ld128/s_logl.c"
                "upstream-freebsd/lib/msun/ld128/s_nanl.c"
            ];
            local_include_dirs = ["upstream-freebsd/lib/msun/ld128/"];
        };
    };

    #  arch-specific settings
    arch = {
        arm = {
            srcs = [
                "arm/fenv.c"
            ];
            neon = {
                srcs = [
                    "arm/sqrt.S"
                    "arm/floor.S"
                ];

                exclude_srcs = [
                    "upstream-freebsd/lib/msun/src/e_sqrt.c"
                    "upstream-freebsd/lib/msun/src/e_sqrtf.c"
                    "upstream-freebsd/lib/msun/src/s_floor.c"
                ];
            };
            instruction_set = "arm";
            pack_relocations = false;
            ldflags = ["-Wl,--hash-style=both"];
            version_script = ":libm.arm.map";
        };

        arm64 = {
            srcs = [
                "arm64/fenv.c"
                "arm64/lrint.S"
                "arm64/sqrt.S"
            ];
            exclude_srcs = [
                "upstream-freebsd/lib/msun/src/e_sqrt.c"
                "upstream-freebsd/lib/msun/src/e_sqrtf.c"
                "upstream-freebsd/lib/msun/src/s_ceil.c"
                "upstream-freebsd/lib/msun/src/s_ceilf.c"
                "upstream-freebsd/lib/msun/src/s_floor.c"
                "upstream-freebsd/lib/msun/src/s_floorf.c"
                "upstream-freebsd/lib/msun/src/s_fma.c"
                "upstream-freebsd/lib/msun/src/s_fmaf.c"
                "upstream-freebsd/lib/msun/src/s_fmax.c"
                "upstream-freebsd/lib/msun/src/s_fmaxf.c"
                "upstream-freebsd/lib/msun/src/s_fmin.c"
                "upstream-freebsd/lib/msun/src/s_fminf.c"
                "upstream-freebsd/lib/msun/src/s_llrint.c"
                "upstream-freebsd/lib/msun/src/s_llrintf.c"
                "upstream-freebsd/lib/msun/src/s_lrint.c"
                "upstream-freebsd/lib/msun/src/s_lrintf.c"
                "upstream-freebsd/lib/msun/src/s_rint.c"
                "upstream-freebsd/lib/msun/src/s_rintf.c"
                "upstream-freebsd/lib/msun/src/s_round.c"
                "upstream-freebsd/lib/msun/src/s_roundf.c"
                "upstream-freebsd/lib/msun/src/s_trunc.c"
                "upstream-freebsd/lib/msun/src/s_truncf.c"
            ];
            version_script = ":libm.arm64.map";
        };

        x86 = {
            srcs = [
                "i387/fenv.c"
                "x86/sqrt.S"
                "x86/sqrtf.S"
                "x86/e_acos.S"
                "x86/e_asin.S"
                "x86/e_atan2.S"
                "x86/e_cosh.S"
                "x86/e_hypot.S"
                "x86/e_log10.S"
                "x86/e_sinh.S"
                "x86/libm_reduce_pi04l.S"
                "x86/libm_sincos_huge.S"
                "x86/libm_tancot_huge.S"
                "x86/lrint.S"
                "x86/lrintf.S"
                "x86/s_atan.S"
                "x86/s_cbrt.S"
                "x86/s_cos.S"
                "x86/s_expm1.S"
                "x86/s_log1p.S"
                "x86/s_sin.S"
                "x86/s_tanh.S"
                "x86/s_tan.S"
            ];
            exclude_srcs = [
                "upstream-freebsd/lib/msun/src/e_acos.c"
                "upstream-freebsd/lib/msun/src/e_asin.c"
                "upstream-freebsd/lib/msun/src/e_atan2.c"
                "upstream-freebsd/lib/msun/src/e_cosh.c"
                "upstream-freebsd/lib/msun/src/e_hypot.c"
                "upstream-freebsd/lib/msun/src/e_log10.c"
                "upstream-freebsd/lib/msun/src/e_sinh.c"
                "upstream-freebsd/lib/msun/src/e_sqrt.c"
                "upstream-freebsd/lib/msun/src/e_sqrtf.c"
                "upstream-freebsd/lib/msun/src/s_atan.c"
                "upstream-freebsd/lib/msun/src/s_cbrt.c"
                "upstream-freebsd/lib/msun/src/s_cos.c"
                "upstream-freebsd/lib/msun/src/s_expm1.c"
                "upstream-freebsd/lib/msun/src/s_log1p.c"
                "upstream-freebsd/lib/msun/src/s_lrint.c"
                "upstream-freebsd/lib/msun/src/s_lrintf.c"
                "upstream-freebsd/lib/msun/src/s_sin.c"
                "upstream-freebsd/lib/msun/src/s_tan.c"
                "upstream-freebsd/lib/msun/src/s_tanh.c"
            ];
            sse4_1 = {
                srcs = [
                    "x86/ceil.S"
                    "x86/ceilf.S"
                    "x86/floor.S"
                    "x86/floorf.S"
                    "x86/rint.S"
                    "x86/rintf.S"
                    "x86/trunc.S"
                    "x86/truncf.S"
                ];
                exclude_srcs = [
                    "upstream-freebsd/lib/msun/src/s_ceil.c"
                    "upstream-freebsd/lib/msun/src/s_ceilf.c"
                    "upstream-freebsd/lib/msun/src/s_floor.c"
                    "upstream-freebsd/lib/msun/src/s_floorf.c"
                    "upstream-freebsd/lib/msun/src/s_rint.c"
                    "upstream-freebsd/lib/msun/src/s_rintf.c"
                    "upstream-freebsd/lib/msun/src/s_trunc.c"
                    "upstream-freebsd/lib/msun/src/s_truncf.c"
                ];
            };
            local_include_dirs = ["i387"];
            pack_relocations = false;
            ldflags = ["-Wl,--hash-style=both"];
            version_script = ":libm.x86.map";
        };

        x86_64 = {
            srcs = [
                "amd64/fenv.c"
                "x86_64/sqrt.S"
                "x86_64/sqrtf.S"
                "x86_64/e_acos.S"
                "x86_64/e_asin.S"
                "x86_64/e_atan2.S"
                "x86_64/e_cosh.S"
                "x86_64/e_hypot.S"
                "x86_64/e_log10.S"
                "x86_64/e_sinh.S"
                "x86_64/lrint.S"
                "x86_64/lrintf.S"
                "x86_64/s_atan.S"
                "x86_64/s_cbrt.S"
                "x86_64/s_cos.S"
                "x86_64/s_expm1.S"
                "x86_64/s_log1p.S"
                "x86_64/s_sin.S"
                "x86_64/s_tanh.S"
                "x86_64/s_tan.S"
            ];
            exclude_srcs = [
                "upstream-freebsd/lib/msun/src/e_acos.c"
                "upstream-freebsd/lib/msun/src/e_asin.c"
                "upstream-freebsd/lib/msun/src/e_atan2.c"
                "upstream-freebsd/lib/msun/src/e_cosh.c"
                "upstream-freebsd/lib/msun/src/e_hypot.c"
                "upstream-freebsd/lib/msun/src/e_log10.c"
                "upstream-freebsd/lib/msun/src/e_sinh.c"
                "upstream-freebsd/lib/msun/src/e_sqrt.c"
                "upstream-freebsd/lib/msun/src/e_sqrtf.c"
                "upstream-freebsd/lib/msun/src/s_atan.c"
                "upstream-freebsd/lib/msun/src/s_cbrt.c"
                "upstream-freebsd/lib/msun/src/s_cos.c"
                "upstream-freebsd/lib/msun/src/s_expm1.c"
                "upstream-freebsd/lib/msun/src/s_log1p.c"
                "upstream-freebsd/lib/msun/src/s_llrint.c"
                "upstream-freebsd/lib/msun/src/s_llrintf.c"
                "upstream-freebsd/lib/msun/src/s_lrint.c"
                "upstream-freebsd/lib/msun/src/s_lrintf.c"
                "upstream-freebsd/lib/msun/src/s_sin.c"
                "upstream-freebsd/lib/msun/src/s_tan.c"
                "upstream-freebsd/lib/msun/src/s_tanh.c"
            ];
            sse4_1 = {
                srcs = [
                    "x86_64/ceil.S"
                    "x86_64/ceilf.S"
                    "x86_64/floor.S"
                    "x86_64/floorf.S"
                    "x86_64/rint.S"
                    "x86_64/rintf.S"
                    "x86_64/trunc.S"
                    "x86_64/truncf.S"
                ];
                exclude_srcs = [
                    "upstream-freebsd/lib/msun/src/s_ceil.c"
                    "upstream-freebsd/lib/msun/src/s_ceilf.c"
                    "upstream-freebsd/lib/msun/src/s_floor.c"
                    "upstream-freebsd/lib/msun/src/s_floorf.c"
                    "upstream-freebsd/lib/msun/src/s_rint.c"
                    "upstream-freebsd/lib/msun/src/s_rintf.c"
                    "upstream-freebsd/lib/msun/src/s_trunc.c"
                    "upstream-freebsd/lib/msun/src/s_truncf.c"
                ];
            };
            version_script = ":libm.x86_64.map";
        };
    };

    local_include_dirs = [
        "upstream-freebsd/android/include/"
        "upstream-freebsd/lib/msun/src/"
    ];

    cflags = [
        "-D__BIONIC_LP32_USE_LONG_DOUBLE"
        "-D__BIONIC_NO_MATH_INLINES"
        "-D_BSD_SOURCE"
        "-DFLT_EVAL_METHOD=0"
        "-include freebsd-compat.h"
        "-fno-math-errno"
        "-Wall"
        "-Werror"
        "-Wno-missing-braces"
        "-Wno-parentheses"
        "-Wno-sign-compare"
        "-Wno-unknown-pragmas"
        "-Wno-unused-const-variable"
        "-Wno-unused-variable"
    ];

    ldflags = [
        "-Wl,--Bsymbolic-functions"
    ];

    #  b/120614316, non-critical readibility check
    tidy_checks = ["-cert-dcl16-c"];

    include_dirs = ["bionic/libc"];
    system_shared_libs = ["libc"];

    native_coverage = bionic_coverage;
    sanitize = {
        address = false;
        coverage = false;
        integer_overflow = false;
    };
    stl = "none";

    stubs = {
        symbol_file = "libm.map.txt";
        versions = ["10000"];
    };
};

"libm.arm.map" = genrule {
    name = "libm.arm.map";
    out = ["libm.arm.map"];
    srcs = ["libm.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) arm $(in) $(out)";
};

"libm.arm64.map" = genrule {
    name = "libm.arm64.map";
    out = ["libm.arm64.map"];
    srcs = ["libm.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) arm64 $(in) $(out)";
};

"libm.x86.map" = genrule {
    name = "libm.x86.map";
    out = ["libm.x86.map"];
    srcs = ["libm.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) x86 $(in) $(out)";
};

"libm.x86_64.map" = genrule {
    name = "libm.x86_64.map";
    out = ["libm.x86_64.map"];
    srcs = ["libm.map.txt"];
    tool_files = [":bionic-generate-version-script"];
    cmd = "$(location :bionic-generate-version-script) x86_64 $(in) $(out)";
};

in { inherit "libm.arm.map" "libm.arm64.map" "libm.x86.map" "libm.x86_64.map" libm; }
