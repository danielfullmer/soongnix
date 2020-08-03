{ android_app_certificate }:
let

FrameworksCoreTests_keyset_A_cert = android_app_certificate {
    name = "FrameworksCoreTests_keyset_A_cert";
    certificate = "keyset_A";
};

FrameworksCoreTests_keyset_B_cert = android_app_certificate {
    name = "FrameworksCoreTests_keyset_B_cert";
    certificate = "keyset_B";
};

FrameworksCoreTests_unit_test_cert = android_app_certificate {
    name = "FrameworksCoreTests_unit_test_cert";
    certificate = "unit_test";
};

in { inherit FrameworksCoreTests_keyset_A_cert FrameworksCoreTests_keyset_B_cert FrameworksCoreTests_unit_test_cert; }
