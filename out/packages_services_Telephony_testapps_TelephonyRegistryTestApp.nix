{ android_test }:
let

TelephonyRegistryTestApp = android_test {
    name = "TelephonyRegistryTestApp";
    srcs = ["src/com/android/phone/testapps/telephonyregistry/TelephonyRegistryTestApp.java"];
    platform_apis = true;
    certificate = "platform";
    # LOCAL_MODULE_TAGS := debug
};

in { inherit TelephonyRegistryTestApp; }
