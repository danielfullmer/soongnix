{ android_app_certificate, apex, apex_defaults, apex_key, apex_test, prebuilt_etc }:
let

"com.android.adbd-defaults" = apex_defaults {
    name = "com.android.adbd-defaults";
    updatable = true;
    min_sdk_version = "R";

    binaries = ["adbd"];
    compile_multilib = "both";
    multilib = {
        both = {
            native_shared_libs = [
                "libadb_pairing_auth"
                "libadb_pairing_connection"
                "libadb_pairing_server"
                "libadbconnection_client"
            ];
        };
    };
    prebuilts = ["com.android.adbd.init.rc"];

    key = "com.android.adbd.key";
    certificate = ":com.android.adbd.certificate";
};

"com.android.adbd" = apex {
    name = "com.android.adbd";
    defaults = ["com.android.adbd-defaults"];
    manifest = "apex_manifest.json";
};

#  adbd apex with INT_MAX version code, to allow for upgrade/rollback testing.
"test_com.android.adbd" = apex_test {
    name = "test_com.android.adbd";
    defaults = ["com.android.adbd-defaults"];
    manifest = "test_apex_manifest.json";
    file_contexts = ":com.android.adbd-file_contexts";
    installable = false;
};

"com.android.adbd.init.rc" = prebuilt_etc {
    name = "com.android.adbd.init.rc";
    src = "adbd.rc";
    filename = "init.rc";
    installable = false;
};

"com.android.adbd.key" = apex_key {
    name = "com.android.adbd.key";
    public_key = "com.android.adbd.avbpubkey";
    private_key = "com.android.adbd.pem";
};

"com.android.adbd.certificate" = android_app_certificate {
    name = "com.android.adbd.certificate";
    certificate = "com.android.adbd";
};

in { inherit "com.android.adbd" "com.android.adbd-defaults" "com.android.adbd.certificate" "com.android.adbd.init.rc" "com.android.adbd.key" "test_com.android.adbd"; }
