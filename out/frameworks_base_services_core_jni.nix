{ cc_defaults, cc_library_static, filegroup }:
let

"libservices.core" = cc_library_static {
    name = "libservices.core";
    defaults = ["libservices.core-libs"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wthread-safety"

        "-DEGL_EGLEXT_PROTOTYPES"
        "-DGL_GLEXT_PROTOTYPES"
    ];

    srcs = [
        "BroadcastRadio/JavaRef.cpp"
        "BroadcastRadio/NativeCallbackThread.cpp"
        "BroadcastRadio/BroadcastRadioService.cpp"
        "BroadcastRadio/Tuner.cpp"
        "BroadcastRadio/TunerCallback.cpp"
        "BroadcastRadio/convert.cpp"
        "BroadcastRadio/regions.cpp"
        "com_android_server_AlarmManagerService.cpp"
        "com_android_server_am_BatteryStatsService.cpp"
        "com_android_server_connectivity_Vpn.cpp"
        "com_android_server_connectivity_tethering_OffloadHardwareInterface.cpp"
        "com_android_server_ConsumerIrService.cpp"
        "com_android_server_devicepolicy_CryptoTestHelper.cpp"
        "com_android_server_HardwarePropertiesManagerService.cpp"
        "com_android_server_hdmi_HdmiCecController.cpp"
        "com_android_server_input_InputManagerService.cpp"
        "com_android_server_lights_LightsService.cpp"
        "com_android_server_location_GnssLocationProvider.cpp"
        "com_android_server_locksettings_SyntheticPasswordManager.cpp"
        "com_android_server_net_NetworkStatsService.cpp"
        "com_android_server_power_PowerManagerService.cpp"
        "com_android_server_security_VerityUtils.cpp"
        "com_android_server_SerialService.cpp"
        "com_android_server_storage_AppFuseBridge.cpp"
        "com_android_server_SystemServer.cpp"
        "com_android_server_TestNetworkService.cpp"
        "com_android_server_tv_TvUinputBridge.cpp"
        "com_android_server_tv_TvInputHal.cpp"
        "com_android_server_vr_VrManagerService.cpp"
        "com_android_server_UsbAlsaJackDetector.cpp"
        "com_android_server_UsbDeviceManager.cpp"
        "com_android_server_UsbDescriptorParser.cpp"
        "com_android_server_UsbMidiDevice.cpp"
        "com_android_server_UsbHostManager.cpp"
        "com_android_server_VibratorService.cpp"
        "com_android_server_PersistentDataBlockService.cpp"
        "com_android_server_GraphicsStatsService.cpp"
        "com_android_server_am_AppCompactor.cpp"
        "com_android_server_am_LowMemDetector.cpp"
        "onload.cpp"
        ":lib_networkStatsFactory_native"
    ];

    include_dirs = [
        "bionic/libc/private"
        "frameworks/base/libs"
        "frameworks/native/services"
        "system/gatekeeper/include"
    ];
};

"libservices.core-libs" = cc_defaults {
    name = "libservices.core-libs";
    shared_libs = [
        "libandroid_runtime"
        "libandroidfw"
        "libaudioclient"
        "libbase"
        "libappfuse"
        "libbinder"
        "libcutils"
        "libcrypto"
        "liblog"
        "libhardware"
        "libhardware_legacy"
        "libhidlbase"
        "libkeystore_binder"
        "libmtp"
        "libnativehelper"
        "libutils"
        "libui"
        "libinput"
        "libinputflinger"
        "libinputflinger_base"
        "libinputservice"
        "libschedulerservicehidl"
        "libsensorservice"
        "libsensorservicehidl"
        "libgui"
        "libusbhost"
        "libtinyalsa"
        "libEGL"
        "libGLESv2"
        "libnetutils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libutils"
        "libhwui"
        "libbpf_android"
        "libnetdbpf"
        "libnetdutils"
        "libpsi"
        "android.hardware.audio.common@2.0"
        "android.hardware.broadcastradio@1.0"
        "android.hardware.broadcastradio@1.1"
        "android.hardware.contexthub@1.0"
        "android.hardware.gnss@1.0"
        "android.hardware.gnss@1.1"
        "android.hardware.gnss@2.0"
        "android.hardware.gnss.measurement_corrections@1.0"
        "android.hardware.gnss.visibility_control@1.0"
        "android.hardware.input.classifier@1.0"
        "android.hardware.ir@1.0"
        "android.hardware.light@2.0"
        "android.hardware.power@1.0"
        "android.hardware.power@1.1"
        "android.hardware.power.stats@1.0"
        "android.hardware.tetheroffload.config@1.0"
        "android.hardware.thermal@1.0"
        "android.hardware.tv.cec@1.0"
        "android.hardware.tv.input@1.0"
        "android.hardware.vibrator@1.0"
        "android.hardware.vibrator@1.1"
        "android.hardware.vibrator@1.2"
        "android.hardware.vibrator@1.3"
        "android.hardware.vr@1.0"
        "android.frameworks.schedulerservice@1.0"
        "android.frameworks.sensorservice@1.0"
        "android.system.suspend@1.0"
        "suspend_control_aidl_interface-cpp"
    ];

    static_libs = [
        "android.hardware.broadcastradio@common-utils-1x-lib"
    ];

    product_variables = {
        arc = {
            shared_libs = [
                "libarcbridge"
                "libarcbridgeservice"
                "libarctimer"
                "libbase"
                "libcap"
                "libchrome"
                "libmojo"
            ];
        };
    };
};

lib_networkStatsFactory_native = filegroup {
    name = "lib_networkStatsFactory_native";
    srcs = [
        "com_android_server_net_NetworkStatsFactory.cpp"
    ];
};

in { inherit "libservices.core" "libservices.core-libs" lib_networkStatsFactory_native; }
