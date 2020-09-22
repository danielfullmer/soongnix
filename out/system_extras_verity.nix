{ cc_binary_host, cc_defaults, cc_library_static, cc_test, java_binary_host, python_binary_host }:
let

generate_verity_key = cc_binary_host {
    name = "generate_verity_key";
    srcs = ["generate_verity_key.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libcrypto_utils"
        "libcrypto"
    ];
};

verity_signer = java_binary_host {
    name = "verity_signer";
    srcs = [
        "VeritySigner.java"
        "Utils.java"
    ];
    manifest = "VeritySigner.mf";

    static_libs = ["bouncycastle-unbundled"];
};

boot_signer = java_binary_host {
    name = "boot_signer";
    srcs = [
        "BootSignature.java"
        "VeritySigner.java"
        "Utils.java"
    ];
    manifest = "BootSignature.mf";

    static_libs = ["bouncycastle-unbundled"];
};

verity_verifier = cc_binary_host {
    name = "verity_verifier";
    srcs = ["verity_verifier.cpp"];

    target = {
        darwin = {
            enabled = false;
        };
    };

    sanitize = {
        misc_undefined = ["integer"];
    };
    static_libs = [
        "libfec"
        "libfec_rs"
        "libavb"
        "libcrypto_utils"
        "libcrypto"
        "libext4_utils"
        "liblog"
        "libsparse"
        "libsquashfs_utils"
        "libbase"
        "libz"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

verity_tree_defaults = cc_defaults {
    name = "verity_tree_defaults";
    cflags = [
        "-D_FILE_OFFSET_BITS=64"
        "-Wall"
        "-Werror"
    ];

    static_libs = [
        "libsparse"
        "libz"
    ];
    shared_libs = [
        "libcrypto"
        "libbase"
    ];

    host_supported = true;
};

libverity_tree = cc_library_static {
    name = "libverity_tree";
    defaults = [
        "verity_tree_defaults"
    ];
    recovery_available = true;

    export_include_dirs = ["include"];
    srcs = [
        "build_verity_tree.cpp"
        "build_verity_tree_utils.cpp"
        "hash_tree_builder.cpp"
    ];
};

build_verity_tree = cc_binary_host {
    name = "build_verity_tree";
    defaults = [
        "verity_tree_defaults"
    ];

    srcs = [
        "build_verity_tree_main.cpp"
    ];

    static_libs = [
        "libverity_tree"
    ];
};

build_verity_tree_test = cc_test {
    name = "build_verity_tree_test";
    defaults = [
        "verity_tree_defaults"
    ];

    srcs = [
        "build_verity_tree_test.cpp"
    ];

    static_libs = [
        "libverity_tree"
    ];
};

build_verity_metadata = python_binary_host {
    name = "build_verity_metadata";
    srcs = ["build_verity_metadata.py"];
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
            embedded_launcher = false;
        };
    };
};

in { inherit boot_signer build_verity_metadata build_verity_tree build_verity_tree_test generate_verity_key libverity_tree verity_signer verity_tree_defaults verity_verifier; }
