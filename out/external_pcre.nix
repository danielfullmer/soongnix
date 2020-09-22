{ cc_defaults, cc_library }:
let



libpcre2_dist_prefix = "dist2";

libpcre2_src_files = [
    (libpcre2_dist_prefix + "/src/pcre2_auto_possess.c")
    (libpcre2_dist_prefix + "/src/pcre2_compile.c")
    (libpcre2_dist_prefix + "/src/pcre2_config.c")
    (libpcre2_dist_prefix + "/src/pcre2_context.c")
    (libpcre2_dist_prefix + "/src/pcre2_convert.c")
    (libpcre2_dist_prefix + "/src/pcre2_dfa_match.c")
    (libpcre2_dist_prefix + "/src/pcre2_error.c")
    (libpcre2_dist_prefix + "/src/pcre2_extuni.c")
    (libpcre2_dist_prefix + "/src/pcre2_find_bracket.c")
    (libpcre2_dist_prefix + "/src/pcre2_maketables.c")
    (libpcre2_dist_prefix + "/src/pcre2_match.c")
    (libpcre2_dist_prefix + "/src/pcre2_match_data.c")
    (libpcre2_dist_prefix + "/src/pcre2_jit_compile.c")
    (libpcre2_dist_prefix + "/src/pcre2_newline.c")
    (libpcre2_dist_prefix + "/src/pcre2_ord2utf.c")
    (libpcre2_dist_prefix + "/src/pcre2_pattern_info.c")
    (libpcre2_dist_prefix + "/src/pcre2_script_run.c")
    (libpcre2_dist_prefix + "/src/pcre2_serialize.c")
    (libpcre2_dist_prefix + "/src/pcre2_string_utils.c")
    (libpcre2_dist_prefix + "/src/pcre2_study.c")
    (libpcre2_dist_prefix + "/src/pcre2_substitute.c")
    (libpcre2_dist_prefix + "/src/pcre2_substring.c")
    (libpcre2_dist_prefix + "/src/pcre2_tables.c")
    (libpcre2_dist_prefix + "/src/pcre2_ucd.c")
    (libpcre2_dist_prefix + "/src/pcre2_valid_utf.c")
    (libpcre2_dist_prefix + "/src/pcre2_xclass.c")
    (libpcre2_dist_prefix + "/src/pcre2_chartables.c")
];

pcre_defaults = cc_defaults {
    name = "pcre_defaults";
    cflags = [
        "-DHAVE_CONFIG_H"
        "-Wall"
        "-Werror"
    ];
    tidy_checks = [
        "-google-build-using-namespace"
        "-google-global-names-in-headers"
    ];
    local_include_dirs = [
        "include_internal"
        "include"
    ];
    export_include_dirs = ["include"];
};

#
#  libpcre2
#

libpcre2 = cc_library {
    name = "libpcre2";
    defaults = ["pcre_defaults"];
    host_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    recovery_available = true;
    srcs = libpcre2_src_files;
    stl = "none";
    system_shared_libs = ["libc"];
    target = {
        linux_bionic = {
            enabled = true;
        };
    };
};

in { inherit libpcre2 pcre_defaults; }
