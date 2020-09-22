{ cc_binary, cc_binary_host, cc_defaults, genrule, sh_test }:
let

bc-defaults = cc_defaults {
    name = "bc-defaults";

    cflags = [
        "-include bc-version.h"
        "-DBC_ENABLED=1"
        "-DDC_ENABLED=0"
        "-DBC_ENABLE_EXTRA_MATH=0"
        "-DBC_ENABLE_HISTORY=0"
        "-DBC_ENABLE_NLS=0"
        "-DBC_ENABLE_SIGNALS=1"
        "-Os"
    ];
    generated_headers = ["bc-version.h"];
    local_include_dirs = ["include"];
    srcs = [
        "src/bc/bc.c"
        "src/bc/lex.c"
        "src/bc/parse.c"
        "src/args.c"
        "src/data.c"
        "src/lang.c"
        "src/lex.c"
        "src/main.c"
        "src/num.c"
        "src/parse.c"
        "src/program.c"
        "src/read.c"
        "src/vector.c"
        "src/vm.c"
        ":bc-bc_help.c"
        ":bc-lib.c"
    ];
    stl = "none";
};

"bc-lib.c" = genrule {
    name = "bc-lib.c";
    srcs = ["gen/lib.bc"];
    out = ["gen/lib.c"];
    tool_files = ["gen/strgen.sh"];
    cmd = "$(location gen/strgen.sh) $(in) $(out) bc_lib bc.h bc_lib_name BC_ENABLED";
};

"bc-bc_help.c" = genrule {
    name = "bc-bc_help.c";
    srcs = ["gen/bc_help.txt"];
    out = ["gen/bc_help.c"];
    tool_files = ["gen/strgen.sh"];
    cmd = "$(location gen/strgen.sh) $(in) $(out) bc_help bc.h '' BC_ENABLED";
};

"bc-version.h" = genrule {
    name = "bc-version.h";
    srcs = ["Makefile.in"];
    out = ["bc-version.h"];
    cmd = "sed -n 's/VERSION = /#define VERSION /p' $(in) > $(out)";
};

bc = cc_binary {
    name = "bc";
    defaults = ["bc-defaults"];
};

bc_vendor = cc_binary {
    name = "bc_vendor";
    defaults = ["bc-defaults"];
    stem = "bc";
    vendor = true;
};

gavinhoward-bc = cc_binary_host {
    name = "gavinhoward-bc";
    defaults = ["bc-defaults"];
};

bc-tests = sh_test {
    name = "bc-tests";
    src = "run-bc-tests-on-android.sh";
    filename = "run-bc-tests-on-android.sh";
    test_suites = ["general-tests"];
    host_supported = true;
    device_supported = false;
    test_config = "bc-tests.xml";
    data = [
        "functions.sh"
        "tests/afl.py"
        "tests/all.sh"
        "tests/all.txt"
        "tests/bc/"
        "tests/dc/"
        "tests/errors.sh"
        "tests/randmath.py"
        "tests/read.sh"
        "tests/script.sh"
        "tests/scripts.sh"
        "tests/stdin.sh"
        "tests/test.sh"
        "tests/bc/abs.txt"
        "tests/bc/abs_results.txt"
        "tests/bc/add.txt"
        "tests/bc/add_results.txt"
        "tests/bc/all.txt"
        "tests/bc/arctangent.txt"
        "tests/bc/arctangent_results.txt"
        "tests/bc/arrays.txt"
        "tests/bc/arrays_results.txt"
        "tests/bc/assignments.txt"
        "tests/bc/assignments_results.txt"
        "tests/bc/boolean.txt"
        "tests/bc/boolean_results.txt"
        "tests/bc/comp.txt"
        "tests/bc/comp_results.txt"
        "tests/bc/cosine.txt"
        "tests/bc/cosine_results.txt"
        "tests/bc/decimal.txt"
        "tests/bc/decimal_results.txt"
        "tests/bc/divide.txt"
        "tests/bc/divide_results.txt"
        "tests/bc/engineering.txt"
        "tests/bc/engineering_results.txt"
        "tests/bc/errors/"
        "tests/bc/errors.txt"
        "tests/bc/exponent.txt"
        "tests/bc/exponent_results.txt"
        "tests/bc/functions.txt"
        "tests/bc/functions_results.txt"
        "tests/bc/globals.txt"
        "tests/bc/globals_results.txt"
        "tests/bc/length.txt"
        "tests/bc/length_results.txt"
        "tests/bc/letters.txt"
        "tests/bc/letters_results.txt"
        "tests/bc/lib2.txt"
        "tests/bc/lib2_results.txt"
        "tests/bc/log.txt"
        "tests/bc/log_results.txt"
        "tests/bc/misc.txt"
        "tests/bc/misc1.txt"
        "tests/bc/misc1_results.txt"
        "tests/bc/misc2.txt"
        "tests/bc/misc2_results.txt"
        "tests/bc/misc3.txt"
        "tests/bc/misc3_results.txt"
        "tests/bc/misc4.txt"
        "tests/bc/misc4_results.txt"
        "tests/bc/misc5.txt"
        "tests/bc/misc5_results.txt"
        "tests/bc/misc_results.txt"
        "tests/bc/modulus.txt"
        "tests/bc/modulus_results.txt"
        "tests/bc/multiply.txt"
        "tests/bc/multiply_results.txt"
        "tests/bc/pi.txt"
        "tests/bc/pi_results.txt"
        "tests/bc/places.txt"
        "tests/bc/places_results.txt"
        "tests/bc/posix_errors.txt"
        "tests/bc/power.txt"
        "tests/bc/power_results.txt"
        "tests/bc/print2.txt"
        "tests/bc/print2_results.txt"
        "tests/bc/read.txt"
        "tests/bc/read_errors.txt"
        "tests/bc/read_results.txt"
        "tests/bc/scale.txt"
        "tests/bc/scale_results.txt"
        "tests/bc/scientific.txt"
        "tests/bc/scientific_results.txt"
        "tests/bc/scripts/"
        "tests/bc/shift.txt"
        "tests/bc/shift_results.txt"
        "tests/bc/sine.txt"
        "tests/bc/sine_results.txt"
        "tests/bc/sqrt.txt"
        "tests/bc/sqrt_results.txt"
        "tests/bc/stdin.txt"
        "tests/bc/stdin_results.txt"
        "tests/bc/strings.txt"
        "tests/bc/strings_results.txt"
        "tests/bc/subtract.txt"
        "tests/bc/subtract_results.txt"
        "tests/bc/timeconst.sh"
        "tests/bc/trunc.txt"
        "tests/bc/trunc_results.txt"
        "tests/bc/vars.txt"
        "tests/bc/vars_results.txt"
        "tests/bc/void.txt"
        "tests/bc/void_results.txt"
        "tests/bc/errors/01.txt"
        "tests/bc/errors/02.txt"
        "tests/bc/errors/03.txt"
        "tests/bc/errors/04.txt"
        "tests/bc/errors/05.txt"
        "tests/bc/errors/06.txt"
        "tests/bc/errors/07.txt"
        "tests/bc/errors/08.txt"
        "tests/bc/errors/09.txt"
        "tests/bc/errors/10.txt"
        "tests/bc/errors/11.txt"
        "tests/bc/errors/12.txt"
        "tests/bc/errors/13.txt"
        "tests/bc/errors/14.txt"
        "tests/bc/errors/15.txt"
        "tests/bc/errors/16.txt"
        "tests/bc/scripts/add.bc"
        "tests/bc/scripts/array.bc"
        "tests/bc/scripts/array.txt"
        "tests/bc/scripts/atan.bc"
        "tests/bc/scripts/atan.txt"
        "tests/bc/scripts/bessel.bc"
        "tests/bc/scripts/divide.bc"
        "tests/bc/scripts/globals.bc"
        "tests/bc/scripts/globals.txt"
        "tests/bc/scripts/multiply.bc"
        "tests/bc/scripts/parse.bc"
        "tests/bc/scripts/print.bc"
        "tests/bc/scripts/references.bc"
        "tests/bc/scripts/references.txt"
        "tests/bc/scripts/screen.bc"
        "tests/bc/scripts/screen.txt"
        "tests/bc/scripts/subtract.bc"
        "tests/dc/abs.txt"
        "tests/dc/abs_results.txt"
        "tests/dc/add.txt"
        "tests/dc/add_results.txt"
        "tests/dc/all.txt"
        "tests/dc/boolean.txt"
        "tests/dc/boolean_results.txt"
        "tests/dc/decimal.txt"
        "tests/dc/decimal_results.txt"
        "tests/dc/divide.txt"
        "tests/dc/divide_results.txt"
        "tests/dc/divmod.txt"
        "tests/dc/divmod_results.txt"
        "tests/dc/engineering.txt"
        "tests/dc/engineering_results.txt"
        "tests/dc/errors/"
        "tests/dc/errors.txt"
        "tests/dc/misc.txt"
        "tests/dc/misc_results.txt"
        "tests/dc/modexp.txt"
        "tests/dc/modexp_results.txt"
        "tests/dc/modulus.txt"
        "tests/dc/modulus_results.txt"
        "tests/dc/multiply.txt"
        "tests/dc/multiply_results.txt"
        "tests/dc/negate.txt"
        "tests/dc/negate_results.txt"
        "tests/dc/places.txt"
        "tests/dc/places_results.txt"
        "tests/dc/power.txt"
        "tests/dc/power_results.txt"
        "tests/dc/read.txt"
        "tests/dc/read_errors.txt"
        "tests/dc/read_results.txt"
        "tests/dc/scientific.txt"
        "tests/dc/scientific_results.txt"
        "tests/dc/scripts/"
        "tests/dc/shift.txt"
        "tests/dc/shift_results.txt"
        "tests/dc/sqrt.txt"
        "tests/dc/sqrt_results.txt"
        "tests/dc/stdin.txt"
        "tests/dc/stdin_results.txt"
        "tests/dc/strings.txt"
        "tests/dc/strings_results.txt"
        "tests/dc/subtract.txt"
        "tests/dc/subtract_results.txt"
        "tests/dc/trunc.txt"
        "tests/dc/trunc_results.txt"
        "tests/dc/vars.txt"
        "tests/dc/vars_results.txt"
        "tests/dc/errors/01.txt"
        "tests/dc/errors/02.txt"
        "tests/dc/errors/03.txt"
        "tests/dc/errors/04.txt"
        "tests/dc/errors/05.txt"
        "tests/dc/errors/06.txt"
        "tests/dc/errors/07.txt"
        "tests/dc/errors/08.txt"
        "tests/dc/errors/09.txt"
        "tests/dc/errors/10.txt"
        "tests/dc/errors/11.txt"
        "tests/dc/errors/12.txt"
        "tests/dc/errors/13.txt"
        "tests/dc/errors/14.txt"
        "tests/dc/errors/15.txt"
        "tests/dc/errors/16.txt"
        "tests/dc/errors/17.txt"
        "tests/dc/errors/18.txt"
        "tests/dc/errors/19.txt"
        "tests/dc/errors/20.txt"
        "tests/dc/errors/21.txt"
        "tests/dc/errors/22.txt"
        "tests/dc/scripts/array.dc"
        "tests/dc/scripts/array.txt"
        "tests/dc/scripts/asciify.dc"
        "tests/dc/scripts/asciify.txt"
        "tests/dc/scripts/else.dc"
        "tests/dc/scripts/else.txt"
        "tests/dc/scripts/factorial.dc"
        "tests/dc/scripts/factorial.txt"
        "tests/dc/scripts/loop.dc"
        "tests/dc/scripts/loop.txt"
        "tests/dc/scripts/prime.dc"
        "tests/dc/scripts/quit.dc"
        "tests/dc/scripts/quit.txt"
        "tests/dc/scripts/stream.dc"
        "tests/dc/scripts/weird.dc"
        "tests/dc/scripts/weird.txt"
    ];
};

in { inherit "bc-bc_help.c" "bc-lib.c" "bc-version.h" bc bc-defaults bc-tests bc_vendor gavinhoward-bc; }
