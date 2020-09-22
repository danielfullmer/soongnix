{ aidl_interface }:
let

"android.hardware.rebootescrow" = aidl_interface {
    name = "android.hardware.rebootescrow";
    vendor_available = true;
    srcs = [
        "android/hardware/rebootescrow/IRebootEscrow.aidl"
    ];
    stability = "vintf";
    backend = {
        java = {
            platform_apis = true;
        };
        ndk = {
            vndk = {
                enabled = true;
            };
        };
    };
    versions = ["1"];
};

in { inherit "android.hardware.rebootescrow"; }
