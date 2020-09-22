{ android_app_certificate }:
let

cts-blob-helper-cert = android_app_certificate {
    name = "cts-blob-helper-cert";
    certificate = "cts-blob-helper-cert";
};

cts-blob-helper-cert2 = android_app_certificate {
    name = "cts-blob-helper-cert2";
    certificate = "cts-blob-helper-cert2";
};

in { inherit cts-blob-helper-cert cts-blob-helper-cert2; }
