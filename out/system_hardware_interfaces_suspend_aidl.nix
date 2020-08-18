{ aidl_interface }:
let

suspend_control_aidl_interface = aidl_interface {
    name = "suspend_control_aidl_interface";
    local_include_dir = ".";
    srcs = [
        "android/system/suspend/ISuspendControlService.aidl"
        "android/system/suspend/ISuspendCallback.aidl"
    ];
};

in { inherit suspend_control_aidl_interface; }
