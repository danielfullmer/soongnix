{ cc_binary, cc_defaults, cc_library, cc_test }:
let

epid_cflags = cc_defaults {
    name = "epid_cflags";
    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
    };
    cflags = [
        "-Wno-missing-braces"
        "-Wno-unknown-pragmas"
        "-Wno-typedef-redefinition"
        "-Wno-missing-field-initializers"
        "-Wno-for-loop-analysis"
        "-Wno-unused-const-variable"
        "-Wno-null-pointer-arithmetic"
        "-fexceptions"
        "-fPIC"
        "-O2"
    ];
};

libippcp = cc_library {
    name = "libippcp";
    defaults = ["epid_cflags"];
    srcs = [
        "ext/ipp/sources/ippcp/*.c"
    ];
    exclude_srcs = [
        "ext/ipp/sources/ippcp/*md5.c"
        "ext/ipp/sources/ippcp/*sm2*.c"
        "ext/ipp/sources/ippcp/*sm3.c"
        "ext/ipp/sources/ippcp/cpinit.c"
        "ext/ipp/sources/ippcp/pcpaes*.c"
        "ext/ipp/sources/ippcp/pcparcfour*.c"
        "ext/ipp/sources/ippcp/pcpdes*.c"
        "ext/ipp/sources/ippcp/pcpdlp*.c"
        "ext/ipp/sources/ippcp/pcphmac*.c"
        "ext/ipp/sources/ippcp/pcpmain.c"
        "ext/ipp/sources/ippcp/pcpmd5*.c"
        "ext/ipp/sources/ippcp/pcpmont_expbinbnu_sscm.c"
        "ext/ipp/sources/ippcp/pcpmont_expwinbnu.c"
        "ext/ipp/sources/ippcp/pcpmont_expwinbnu_sscm.c"
        "ext/ipp/sources/ippcp/pcpng*.c"
        "ext/ipp/sources/ippcp/pcpprime*.c"
        "ext/ipp/sources/ippcp/pcprij*.c"
        "ext/ipp/sources/ippcp/pcprsa*.c"
        "ext/ipp/sources/ippcp/pcpsha1*.c"
        "ext/ipp/sources/ippcp/pcpsm3*.c"
        "ext/ipp/sources/ippcp/pcpsms4*.c"
        "ext/ipp/sources/ippcp/pcptdes*.c"
    ];
    cflags = [
        "-D_IPP_DEBUG"
        "-D_IPP_C99"
        "-D_IPP_v50_"
        "-D_PX"
        "-D_DISABLE_ECP_SM2_"
        "-D_DISABLE_ALG_SHA224_"
        "-D_DISABLE_ALG_SHA512_224_"
        "-D_DISABLE_ALG_MD5_"
        "-D_DISABLE_ALG_SM3_"
        "-Wno-unused-function"
        "-Wno-date-time"
        "-Wno-#pragma-messages"
    ];
    local_include_dirs = [
        "ext/ipp/sources/ippcp/"
        "ext/ipp/sources/include/"
    ];
    export_include_dirs = [
        "ext/ipp/include/"
    ];
};

libepid_common = cc_library {
    name = "libepid_common";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/common/1.1/src/*.c"
        "epid/common/math/src/*.c"
        "epid/common/src/*.c"
    ];
    local_include_dirs = [
        "epid/common/math/src"
        "epid/common/math/"
        "epid/common/src"
    ];
    static_libs = [
        "libippcp"
    ];
};

libepid_member = cc_library {
    name = "libepid_member";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/member/src/*.c"
        "epid/member/tpm2/src/*.c"
    ];
    export_include_dirs = [
        "."
    ];
    static_libs = [
        "libepid_common"
        "libippcp"
    ];
};

libepid_verifier = cc_library {
    name = "libepid_verifier";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/verifier/1.1/src/*.c"
        "epid/verifier/src/*.c"
    ];
    export_include_dirs = [
        "."
    ];
    static_libs = [
        "libepid_common"
        "libippcp"
    ];
};

libepid_util = cc_library {
    name = "libepid_util";
    defaults = ["epid_cflags"];
    srcs = [
        "example/util/src/*.c"
    ];
    export_include_dirs = [
        "example"
    ];
    static_libs = [
        "libepid_common"
    ];
};

libargtable3 = cc_library {
    name = "libargtable3";
    defaults = ["epid_cflags"];
    srcs = [
        "ext/argtable3/argtable3.c"
    ];
    export_include_dirs = [
        "ext/argtable3"
    ];
};

libepid_common_testhelper = cc_library {
    name = "libepid_common_testhelper";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/common-testhelper/*cc"
        "epid/common-testhelper/1.1/*cc"
    ];
    local_include_dirs = [
        "ext"
        "epid/common-testhelper/"
        "epid/common-testhelper/1.1"
    ];
    static_libs = [
        "libepid_member"
        "libepid_verifier"
        "libepid_common"
        "libippcp"
        "libgtest"
    ];
};

epid_verifysig = cc_binary {
    name = "epid_verifysig";
    defaults = ["epid_cflags"];
    srcs = [
        "example/verifysig/src/*.c"
    ];
    local_include_dirs = [
        "example/verifysig"
    ];
    static_libs = [
        "libepid_verifier"
        "libepid_common"
        "libepid_util"
        "libippcp"
        "libargtable3"
    ];
};

epid_signmsg = cc_binary {
    name = "epid_signmsg";
    defaults = ["epid_cflags"];
    srcs = [
        "example/signmsg/src/*.c"
    ];
    local_include_dirs = [
        "example/signmsg"
    ];
    static_libs = [
        "libepid_member"
        "libepid_common"
        "libepid_util"
        "libippcp"
        "libargtable3"
    ];
};

epid_common_testhelper_utest = cc_test {
    name = "epid_common_testhelper_utest";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/common-testhelper/unittests/*cc"
    ];
    local_include_dirs = [
        "ext"
    ];
    static_libs = [
        "libepid_common_testhelper"
        "libepid_member"
        "libepid_verifier"
        "libepid_common"
        "libippcp"
    ];
};

epid_common_utest = cc_test {
    name = "epid_common_utest";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/common/math/unittests/*cc"
        "epid/common/unittests/*cc"
        "epid/common/1.1/unittests/*cc"
    ];
    local_include_dirs = [
        "epid/common/unittests/"
    ];
    static_libs = [
        "libepid_common_testhelper"
        "libepid_member"
        "libepid_verifier"
        "libepid_common"
        "libippcp"
    ];
};

epid_member_utest = cc_test {
    name = "epid_member_utest";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/member/unittests/*cc"
        "epid/member/tpm2/unittests/tpm2_wrapper-testhelper.cc"
    ];
    local_include_dirs = [
        "ext"
    ];
    static_libs = [
        "libepid_common_testhelper"
        "libepid_verifier"
        "libepid_member"
        "libepid_common"
        "libippcp"
    ];
};

epid_member_tpm2_utest = cc_test {
    name = "epid_member_tpm2_utest";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/member/tpm2/unittests/*.cc"
    ];
    exclude_srcs = [
        "epid/member/tpm2/unittests/*tss-test.cc"
    ];
    static_libs = [
        "libepid_common_testhelper"
        "libepid_verifier"
        "libepid_member"
        "libepid_common"
        "libippcp"

    ];
};

epid_verifier_utest = cc_test {
    name = "epid_verifier_utest";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/verifier/unittests/*cc"
        "epid/verifier/1.1/unittests/*cc"
    ];
    static_libs = [
        "libepid_common_testhelper"
        "libepid_verifier"
        "libepid_member"
        "libepid_common"
        "libippcp"
    ];
};

in { inherit epid_cflags epid_common_testhelper_utest epid_common_utest epid_member_tpm2_utest epid_member_utest epid_signmsg epid_verifier_utest epid_verifysig libargtable3 libepid_common libepid_common_testhelper libepid_member libepid_util libepid_verifier libippcp; }
