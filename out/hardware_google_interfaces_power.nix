{ aidl_interface }:
let

pixel-power-ext = aidl_interface {
    name = "pixel-power-ext";
    vendor_available = true;
    srcs = [
        "google/hardware/power/extension/pixel/IPowerExt.aidl"
    ];

    stability = "vintf";

    backend = {
        java = {
            platform_apis = true;
        };
    };
    versions = ["1"];
};

in { inherit pixel-power-ext; }
