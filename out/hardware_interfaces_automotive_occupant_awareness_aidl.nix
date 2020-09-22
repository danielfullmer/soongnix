{ aidl_interface }:
let

"android.hardware.automotive.occupant_awareness" = aidl_interface {
    name = "android.hardware.automotive.occupant_awareness";
    vendor_available = true;
    srcs = [
        "android/hardware/automotive/occupant_awareness/ConfidenceLevel.aidl"
        "android/hardware/automotive/occupant_awareness/DriverMonitoringDetection.aidl"
        "android/hardware/automotive/occupant_awareness/GazeDetection.aidl"
        "android/hardware/automotive/occupant_awareness/IOccupantAwareness.aidl"
        "android/hardware/automotive/occupant_awareness/IOccupantAwarenessClientCallback.aidl"
        "android/hardware/automotive/occupant_awareness/OccupantAwarenessStatus.aidl"
        "android/hardware/automotive/occupant_awareness/OccupantDetection.aidl"
        "android/hardware/automotive/occupant_awareness/OccupantDetections.aidl"
        "android/hardware/automotive/occupant_awareness/PresenceDetection.aidl"
        "android/hardware/automotive/occupant_awareness/Role.aidl"
        "android/hardware/automotive/occupant_awareness/VehicleRegion.aidl"
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

in { inherit "android.hardware.automotive.occupant_awareness"; }
