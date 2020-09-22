{ aidl_interface }:
let

"android.hardware.common" = aidl_interface {
    name = "android.hardware.common";
    host_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    srcs = [
        "android/hardware/common/NativeHandle.aidl"
    ];
    stability = "vintf";
    backend = {
        java = {
            enabled = false;
        };
        cpp = {
            enabled = false;
        };
        ndk = {
            apex_available = [
                "//apex_available:platform"
                "com.android.media.swcodec"
            ];
            min_sdk_version = "29";
        };
    };
    versions = ["1"];
};

in { inherit "android.hardware.common"; }
