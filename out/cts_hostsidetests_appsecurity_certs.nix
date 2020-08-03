{ android_app_certificate }:
let

cts-testkey1 = android_app_certificate {
    name = "cts-testkey1";
    certificate = "cts-testkey1";
};

cts-testkey2 = android_app_certificate {
    name = "cts-testkey2";
    certificate = "cts-testkey2";
};

in { inherit cts-testkey1 cts-testkey2; }
