{ android_app_certificate, apex, apex_key }:
let

#  Runtime (Bionic) APEX module
#
#  In Q this contained Bionic, ART and Libcore.
#  It keeps the name /apex/com.android.runtime for app compat reasons.

"com.android.runtime.certificate" = android_app_certificate {
    name = "com.android.runtime.certificate";
    certificate = "com.android.runtime";
};

"com.android.runtime.key" = apex_key {
    name = "com.android.runtime.key";
    public_key = "com.android.runtime.avbpubkey";
    private_key = "com.android.runtime.pem";
};

"com.android.runtime" = apex {
    name = "com.android.runtime";
    compile_multilib = "both";
    manifest = "manifest.json";
    native_shared_libs = [
        "libc"
        "libm"
        "libdl"
        "libdl_android"
        "libc_malloc_debug"
        "libc_malloc_hooks"
    ];
    multilib = {
        both = {
            binaries = ["linker"];
        };
    };
    key = "com.android.runtime.key";
    certificate = ":com.android.runtime.certificate";
};

in { inherit "com.android.runtime" "com.android.runtime.certificate" "com.android.runtime.key"; }
