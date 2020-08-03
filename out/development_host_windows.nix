{ cc_defaults, cc_prebuilt_library_shared }:
let

AdbWinApi_defaults = cc_defaults {
    name = "AdbWinApi_defaults";

    host_supported = true;
    enabled = false;
    device_supported = false;
    compile_multilib = "32";
    target = {
        windows = {
            enabled = true;
        };
    };
};

AdbWinApi = cc_prebuilt_library_shared {
    name = "AdbWinApi";
    defaults = ["AdbWinApi_defaults"];

    export_include_dirs = ["usb/api"];
    srcs = ["prebuilt/usb/AdbWinApi.dll"];
};

AdbWinUsbApi = cc_prebuilt_library_shared {
    name = "AdbWinUsbApi";
    defaults = ["AdbWinApi_defaults"];
    srcs = ["prebuilt/usb/AdbWinUsbApi.dll"];
};

in { inherit AdbWinApi AdbWinApi_defaults AdbWinUsbApi; }
