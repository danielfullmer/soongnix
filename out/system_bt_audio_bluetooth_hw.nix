{ cc_library_shared, cc_test }:
let

#  The format of the name is audio.<type>.<hardware/etc>.so

"audio.bluetooth.default" = cc_library_shared {
    name = "audio.bluetooth.default";
    relative_install_path = "hw";
    proprietary = true;
    srcs = [
        "audio_bluetooth_hw.cc"
        "stream_apis.cc"
        "device_port_proxy.cc"
        "utils.cc"
    ];
    header_libs = ["libhardware_headers"];
    shared_libs = [
        "android.hardware.bluetooth.audio@2.0"
        "libaudioutils"
        "libbase"
        "libbluetooth_audio_session"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

audio_bluetooth_hw_test = cc_test {
    name = "audio_bluetooth_hw_test";
    srcs = [
        "utils.cc"
        "utils_unittest.cc"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "libutils"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit "audio.bluetooth.default" audio_bluetooth_hw_test; }
