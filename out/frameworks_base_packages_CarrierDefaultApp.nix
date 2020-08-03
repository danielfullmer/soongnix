{ android_app }:
let

CarrierDefaultApp = android_app {
    name = "CarrierDefaultApp";
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
};

in { inherit CarrierDefaultApp; }
