{ android_test_helper_app }:
let

# apks signed by keyset_A
FrameworksCoreTests_keyset_sa_unone = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_sa_unone";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_A_cert";
    manifest = "uNone/AndroidManifest.xml";
};

FrameworksCoreTests_keyset_sa_ua = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_sa_ua";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_A_cert";
    manifest = "uA/AndroidManifest.xml";
};

FrameworksCoreTests_keyset_sa_ub = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_sa_ub";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_A_cert";
    manifest = "uB/AndroidManifest.xml";
};

FrameworksCoreTests_keyset_sa_uab = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_sa_uab";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_A_cert";
    manifest = "uAB/AndroidManifest.xml";
};

FrameworksCoreTests_keyset_sa_ua_ub = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_sa_ua_ub";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_A_cert";
    manifest = "uAuB/AndroidManifest.xml";
};

FrameworksCoreTests_keyset_permdef_sa_unone = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_permdef_sa_unone";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_A_cert";
    manifest = "permDef/AndroidManifest.xml";
};

FrameworksCoreTests_keyset_permuse_sa_ua_ub = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_permuse_sa_ua_ub";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_A_cert";
    manifest = "permUse/AndroidManifest.xml";
};

# apks signed by keyset_B
FrameworksCoreTests_keyset_sb_ua = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_sb_ua";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_B_cert";
    manifest = "uA/AndroidManifest.xml";
};

FrameworksCoreTests_keyset_sb_ub = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_sb_ub";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_B_cert";
    manifest = "uB/AndroidManifest.xml";
};

FrameworksCoreTests_keyset_permuse_sb_ua_ub = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_permuse_sb_ua_ub";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_B_cert";
    manifest = "permUse/AndroidManifest.xml";
};

# apks signed by keyset_A and keyset_B
FrameworksCoreTests_keyset_sab_ua = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_sab_ua";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_A_cert";
    additional_certificates = [":FrameworksCoreTests_keyset_B_cert"];
    manifest = "uA/AndroidManifest.xml";
};

# apks signed by keyset_A and unit_test
FrameworksCoreTests_keyset_sau_ub = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_sau_ub";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = ":FrameworksCoreTests_keyset_A_cert";
    additional_certificates = [":FrameworksCoreTests_keyset_B_cert"];
    manifest = "uB/AndroidManifest.xml";
};

# apks signed by platform only
FrameworksCoreTests_keyset_splat_api = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_splat_api";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = "platform";
    manifest = "api_test/AndroidManifest.xml";
};

# apks signed by platform and keyset_A
FrameworksCoreTests_keyset_splata_api = android_test_helper_app {
    name = "FrameworksCoreTests_keyset_splata_api";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = [];
    certificate = "platform";
    additional_certificates = [":FrameworksCoreTests_keyset_A_cert"];
    manifest = "api_test/AndroidManifest.xml";
};

in { inherit FrameworksCoreTests_keyset_permdef_sa_unone FrameworksCoreTests_keyset_permuse_sa_ua_ub FrameworksCoreTests_keyset_permuse_sb_ua_ub FrameworksCoreTests_keyset_sa_ua FrameworksCoreTests_keyset_sa_ua_ub FrameworksCoreTests_keyset_sa_uab FrameworksCoreTests_keyset_sa_ub FrameworksCoreTests_keyset_sa_unone FrameworksCoreTests_keyset_sab_ua FrameworksCoreTests_keyset_sau_ub FrameworksCoreTests_keyset_sb_ua FrameworksCoreTests_keyset_sb_ub FrameworksCoreTests_keyset_splat_api FrameworksCoreTests_keyset_splata_api; }
