{ android_app_certificate }:
let

cts-net-app = android_app_certificate {
    name = "cts-net-app";
    certificate = "cts-net-app";
};

in { inherit cts-net-app; }
