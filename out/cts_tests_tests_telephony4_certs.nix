{ android_app_certificate }:
let

android_telephony_cts_testkey = android_app_certificate {
    name = "android_telephony_cts_testkey";
    certificate = "android_telephony_cts_testkey";
};

in { inherit android_telephony_cts_testkey; }
