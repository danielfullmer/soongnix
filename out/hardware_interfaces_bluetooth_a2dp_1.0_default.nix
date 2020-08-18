{ cc_library_shared }:
let

"android.hardware.bluetooth.a2dp@1.0-impl" = cc_library_shared {
    name = "android.hardware.bluetooth.a2dp@1.0-impl";
    relative_install_path = "hw";
    vendor = true;
    srcs = [
        "BluetoothAudioOffload.cpp"
    ];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "android.hardware.bluetooth.a2dp@1.0"
    ];
};

in { inherit "android.hardware.bluetooth.a2dp@1.0-impl"; }
