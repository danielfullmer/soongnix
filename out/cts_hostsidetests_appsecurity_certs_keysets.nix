{ android_app_certificate }:
let

cts-keyset-test-a = android_app_certificate {
    name = "cts-keyset-test-a";
    certificate = "cts-keyset-test-a";
};

cts-keyset-test-b = android_app_certificate {
    name = "cts-keyset-test-b";
    certificate = "cts-keyset-test-b";
};

cts-keyset-test-c = android_app_certificate {
    name = "cts-keyset-test-c";
    certificate = "cts-keyset-test-c";
};

cts-keyset-test-ec-a = android_app_certificate {
    name = "cts-keyset-test-ec-a";
    certificate = "cts-keyset-test-ec-a";
};

in { inherit cts-keyset-test-a cts-keyset-test-b cts-keyset-test-c cts-keyset-test-ec-a; }
