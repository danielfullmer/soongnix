{ cc_library_shared, filegroup }:
let

libbluetooth-binder = cc_library_shared {
    name = "libbluetooth-binder";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    srcs = [
        "android/bluetooth/bluetooth_device.cc"
        "android/bluetooth/IBluetoothSocketManager.aidl"
        "android/os/parcel_uuid.cc"
        /* TODO: Uncomment this files as they get converted one-by-one into native implementation
        "android/bluetooth/IBluetooth.aidl",
        "android/bluetooth/IBluetoothA2dp.aidl",
        "android/bluetooth/IBluetoothA2dpSink.aidl",
        "android/bluetooth/IBluetoothAvrcpController.aidl",
        "android/bluetooth/IBluetoothAvrcpTarget.aidl",
        "android/bluetooth/IBluetoothCallback.aidl",
        "android/bluetooth/IBluetoothProfileServiceConnection.aidl",
        "android/bluetooth/IBluetoothHeadset.aidl",
        "android/bluetooth/IBluetoothHeadsetPhone.aidl",
        "android/bluetooth/IBluetoothHearingAid.aidl",
        "android/bluetooth/IBluetoothHidHost.aidl",
        "android/bluetooth/IBluetoothPan.aidl",
        "android/bluetooth/IBluetoothManager.aidl",
        "android/bluetooth/IBluetoothManagerCallback.aidl",
        "android/bluetooth/IBluetoothMap.aidl",
        "android/bluetooth/IBluetoothMapClient.aidl",
        "android/bluetooth/IBluetoothPbap.aidl",
        "android/bluetooth/IBluetoothPbapClient.aidl",
        "android/bluetooth/IBluetoothSap.aidl",
        "android/bluetooth/IBluetoothStateChangeCallback.aidl",
        "android/bluetooth/IBluetoothHeadsetClient.aidl",
        "android/bluetooth/IBluetoothHidDevice.aidl",
        "android/bluetooth/IBluetoothHidDeviceCallback.aidl",
        "android/bluetooth/IBluetoothGatt.aidl",
        "android/bluetooth/IBluetoothGattCallback.aidl",
        "android/bluetooth/IBluetoothMetadataListener.aidl",
        "android/bluetooth/IBluetoothGattServerCallback.aidl",
        "android/bluetooth/le/IAdvertisingSetCallback.aidl",
        "android/bluetooth/le/IPeriodicAdvertisingCallback.aidl",
        "android/bluetooth/le/IScannerCallback.aidl"
        */
    ];
    export_include_dirs = ["./"];
    aidl = {
        export_aidl_headers = true;
        include_dirs = [
            "frameworks/native/aidl/binder"

            /* required for android.os.ParcelUuid, and android.os.ParcelFileDescriptor */
            "frameworks/base/core/java"
            "system/bt/binder"
        ];
    };
    include_dirs = [
        "libnativehelper/include/nativehelper"
        "system/bt/types"
    ];
    shared_libs = [
        "libandroid_runtime"
        "libbinder"
        "libchrome"
        "libnativehelper"
        "libcutils"
        "libutils"
        "liblog"
    ];

    static_libs = [
        "libbluetooth-types"
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

#  AIDL interface between libbluetooth-binder and framework.jar
libbluetooth-binder-aidl = filegroup {
    name = "libbluetooth-binder-aidl";
    srcs = [
        "android/bluetooth/IBluetooth.aidl"
        "android/bluetooth/IBluetoothA2dp.aidl"
        "android/bluetooth/IBluetoothA2dpSink.aidl"
        "android/bluetooth/IBluetoothAvrcpController.aidl"
        "android/bluetooth/IBluetoothAvrcpTarget.aidl"
        "android/bluetooth/IBluetoothCallback.aidl"
        "android/bluetooth/IBluetoothProfileServiceConnection.aidl"
        "android/bluetooth/IBluetoothHeadset.aidl"
        "android/bluetooth/IBluetoothHeadsetPhone.aidl"
        "android/bluetooth/IBluetoothHearingAid.aidl"
        "android/bluetooth/IBluetoothHidHost.aidl"
        "android/bluetooth/IBluetoothPan.aidl"
        "android/bluetooth/IBluetoothManager.aidl"
        "android/bluetooth/IBluetoothManagerCallback.aidl"
        "android/bluetooth/IBluetoothMap.aidl"
        "android/bluetooth/IBluetoothMapClient.aidl"
        "android/bluetooth/IBluetoothPbap.aidl"
        "android/bluetooth/IBluetoothPbapClient.aidl"
        "android/bluetooth/IBluetoothSap.aidl"
        "android/bluetooth/IBluetoothSocketManager.aidl"
        "android/bluetooth/IBluetoothStateChangeCallback.aidl"
        "android/bluetooth/IBluetoothHeadsetClient.aidl"
        "android/bluetooth/IBluetoothHidDevice.aidl"
        "android/bluetooth/IBluetoothHidDeviceCallback.aidl"
        "android/bluetooth/IBluetoothGatt.aidl"
        "android/bluetooth/IBluetoothGattCallback.aidl"
        "android/bluetooth/IBluetoothMetadataListener.aidl"
        "android/bluetooth/IBluetoothGattServerCallback.aidl"
        "android/bluetooth/le/IAdvertisingSetCallback.aidl"
        "android/bluetooth/le/IPeriodicAdvertisingCallback.aidl"
        "android/bluetooth/le/IScannerCallback.aidl"
    ];
};

in { inherit libbluetooth-binder libbluetooth-binder-aidl; }
