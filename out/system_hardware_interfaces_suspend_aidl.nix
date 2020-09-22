{ aidl_interface }:
let

suspend_control_aidl_interface = aidl_interface {
    name = "suspend_control_aidl_interface";
    unstable = true;
    local_include_dir = ".";
    srcs = [
        "android/system/suspend/ISuspendControlService.aidl"
        "android/system/suspend/ISuspendCallback.aidl"
        "android/system/suspend/WakeLockInfo.aidl"
    ];
    backend = {
        java = {
            sdk_version = "28";
        };
    };
};

in { inherit suspend_control_aidl_interface; }
