{ android_app }:
let

#  NCI Configuration
NfcNci = android_app {
    name = "NfcNci";
    srcs = [
        "src/**/*.java"
        "nci/**/*.java"
    ];
    platform_apis = true;
    certificate = "platform";
    jni_libs = ["libnfc_nci_jni"];
    static_libs = ["androidx.legacy_legacy-support-v4"];
    optimize = {
        enabled = false;
    };
};

in { inherit NfcNci; }
