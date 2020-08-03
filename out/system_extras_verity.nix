{ cc_binary_host, cc_defaults, cc_library_static, cc_test, java_library_host, sh_binary_host }:
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

VeritySigner = java_library_host {
    name = "VeritySigner";
    srcs = [
        "VeritySigner.java"
        "Utils.java"
    ];
    manifest = "VeritySigner.mf";

    static_libs = ["bouncycastle-unbundled"];
};

BootSignature = java_library_host {
    name = "BootSignature";
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
        "libcrypto_utils"
        "libcrypto"
        "libext4_utils"
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

#  VeritySigner should probably just be a java_binary
verity_signer = sh_binary_host {
    name = "verity_signer";
    src = "verity_signer";
    required = ["VeritySigner"];
};

#  BootSignature should probably just be a java_binary
boot_signer = sh_binary_host {
    name = "boot_signer";
    src = "boot_signer";
    required = ["BootSignature"];
};

#  This should probably be a python_binary_host
"build_verity_metadata.py" = sh_binary_host {
    name = "build_verity_metadata.py";
    src = "build_verity_metadata.py";
};

in { inherit "build_verity_metadata.py" BootSignature VeritySigner boot_signer build_verity_tree build_verity_tree_test generate_verity_key libverity_tree verity_signer verity_tree_defaults verity_verifier; }
