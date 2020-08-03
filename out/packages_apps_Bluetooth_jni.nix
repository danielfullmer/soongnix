{ cc_library_shared }:
let

libbluetooth_jni = cc_library_shared {
    name = "libbluetooth_jni";
    compile_multilib = "first";
    srcs = [
        "bluetooth_socket_manager.cc"
        "com_android_bluetooth_btservice_AdapterService.cpp"
        "com_android_bluetooth_hfp.cpp"
        "com_android_bluetooth_hfpclient.cpp"
        "com_android_bluetooth_a2dp.cpp"
        "com_android_bluetooth_a2dp_sink.cpp"
        "com_android_bluetooth_avrcp_controller.cpp"
        "com_android_bluetooth_avrcp_target.cpp"
        "com_android_bluetooth_hid_host.cpp"
        "com_android_bluetooth_hid_device.cpp"
        "com_android_bluetooth_hearing_aid.cpp"
        "com_android_bluetooth_pan.cpp"
        "com_android_bluetooth_gatt.cpp"
        "com_android_bluetooth_sdp.cpp"
        "IUserManager.cc"
        "permission_helpers.cc"
    ];
    header_libs = ["libbluetooth_headers"];
    include_dirs = [
        "libnativehelper/include/nativehelper"
        "system/bt/types"
    ];
    shared_libs = [
        "libandroid_runtime"
        "libbinder"
        "libbluetooth-binder"
        "libchrome"
        "libnativehelper"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "libbluetooth-types"
        "libcutils"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-unused-parameter"
    ];
    sanitize = {
        scs = true;
    };
};

in { inherit libbluetooth_jni; }
