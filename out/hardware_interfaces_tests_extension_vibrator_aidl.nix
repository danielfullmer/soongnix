{ aidl_interface }:
let

"android.hardware.tests.extension.vibrator" = aidl_interface {
    #  This is an example test interface showing how to add functionality
    #  with setExtension/getExtension
    name = "android.hardware.tests.extension.vibrator";
    vendor_available = true;
    srcs = [
        #  Using android.hardware as the package because this is in
        #  hardware/interfaces. For custom interfaces, normally you
        #  would use a different package.
        "android/hardware/tests/extension/vibrator/Directionality.aidl"
        "android/hardware/tests/extension/vibrator/ICustomVibrator.aidl"
        "android/hardware/tests/extension/vibrator/VendorEffect.aidl"
    ];

    #  This is agreeing to keep the interface stable.
    stability = "vintf";

    #  This happens to use types from a core interface, so we import it, but
    #  this won't always be needed.
    imports = [
        "android.hardware.vibrator"
    ];

    backend = {
        java = {
            enabled = false;
        };
    };
    versions = ["1"];
};

in { inherit "android.hardware.tests.extension.vibrator"; }
