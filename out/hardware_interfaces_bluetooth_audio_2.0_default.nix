{ cc_library_shared }:
let

"android.hardware.bluetooth.audio@2.0-impl" = cc_library_shared {
    name = "android.hardware.bluetooth.audio@2.0-impl";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = [
        "BluetoothAudioProvidersFactory.cpp"
        "BluetoothAudioProvider.cpp"
        "A2dpOffloadAudioProvider.cpp"
        "A2dpSoftwareAudioProvider.cpp"
        "HearingAidAudioProvider.cpp"
    ];
    header_libs = ["libhardware_headers"];
    shared_libs = [
        "android.hardware.audio.common@5.0"
        "android.hardware.bluetooth.audio@2.0"
        "libbase"
        "libbluetooth_audio_session"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
};

libbluetooth_audio_session = cc_library_shared {
    name = "libbluetooth_audio_session";
    defaults = ["hidl_defaults"];
    vendor = true;
    srcs = [
        "session/BluetoothAudioSession.cpp"
        "session/BluetoothAudioSupportedCodecsDB.cpp"
    ];
    export_include_dirs = ["session/"];
    header_libs = ["libhardware_headers"];
    shared_libs = [
        "android.hardware.bluetooth.audio@2.0"
        "libbase"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
};

in { inherit "android.hardware.bluetooth.audio@2.0-impl" libbluetooth_audio_session; }
