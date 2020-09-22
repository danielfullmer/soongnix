{ filegroup }:
let

BluetoothHalSources = filegroup {
    name = "BluetoothHalSources";
    srcs = [
        "snoop_logger.cc"
    ];
};

BluetoothHalSources_hci_rootcanal = filegroup {
    name = "BluetoothHalSources_hci_rootcanal";
    srcs = [
        "hci_hal_host_rootcanal.cc"
    ];
};

BluetoothHalSources_hci_android_hidl = filegroup {
    name = "BluetoothHalSources_hci_android_hidl";
    srcs = [
        "hci_hal_android_hidl.cc"
    ];
};

BluetoothHalTestSources_hci_rootcanal = filegroup {
    name = "BluetoothHalTestSources_hci_rootcanal";
    srcs = [
        "hci_hal_host_rootcanal_test.cc"
    ];
};

BluetoothHalTestSources_hci_android_hidl = filegroup {
    name = "BluetoothHalTestSources_hci_android_hidl";
    srcs = [
        "hci_hal_android_hidl_test.cc"
    ];
};

BluetoothFacade_hci_hal = filegroup {
    name = "BluetoothFacade_hci_hal";
    srcs = [
        "facade.cc"
    ];
};

in { inherit BluetoothFacade_hci_hal BluetoothHalSources BluetoothHalSources_hci_android_hidl BluetoothHalSources_hci_rootcanal BluetoothHalTestSources_hci_android_hidl BluetoothHalTestSources_hci_rootcanal; }
