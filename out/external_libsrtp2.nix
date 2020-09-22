{ cc_library_static }:
let

libsrtp2 = cc_library_static {
    host_supported = true;
    name = "libsrtp2";
    srcs = [
        "crypto/cipher/aes.c"
        "crypto/cipher/aes_icm.c"
        "crypto/cipher/cipher.c"
        "crypto/cipher/null_cipher.c"
        "crypto/hash/auth.c"
        "crypto/hash/hmac.c"
        "crypto/hash/null_auth.c"
        "crypto/hash/sha1.c"
        "crypto/kernel/alloc.c"
        "crypto/kernel/crypto_kernel.c"
        "crypto/kernel/err.c"
        "crypto/kernel/key.c"
        "crypto/math/datatypes.c"
        "crypto/math/stat.c"
        "crypto/replay/rdb.c"
        "crypto/replay/rdbx.c"
        "crypto/replay/ut_sim.c"
        "srtp/ekt.c"
        "srtp/srtp.c"
    ];
    local_include_dirs = [
        "crypto/include"
        "include"
    ];
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-implicit-function-declaration"
        "-DHAVE_CONFIG_H"
    ];
    export_include_dirs = [
        "exported_include"
    ];
};

in { inherit libsrtp2; }
