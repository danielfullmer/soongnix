{ android_app }:
let

CarrierConfig = android_app {
    name = "CarrierConfig";
    srcs = ["src/com/android/carrierconfig/DefaultCarrierConfigService.java"];
    libs = ["telephony-common"];
    platform_apis = true;
    certificate = "platform";
    product_specific = true;
    privileged = true;
    required = ["privapp_whitelist_com.android.carrierconfig"];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    aaptflags = ["--keep-raw-values"];
};

in { inherit CarrierConfig; }
