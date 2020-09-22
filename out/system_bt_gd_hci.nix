{ filegroup }:
let

BluetoothHciSources = filegroup {
    name = "BluetoothHciSources";
    srcs = [
        "acl_manager.cc"
        "acl_fragmenter.cc"
        "address.cc"
        "class_of_device.cc"
        "controller.cc"
        "device.cc"
        "device_database.cc"
        "hci_layer.cc"
        "le_advertising_manager.cc"
        "le_scanning_manager.cc"
    ];
};

BluetoothHciTestSources = filegroup {
    name = "BluetoothHciTestSources";
    srcs = [
        "acl_builder_test.cc"
        "acl_manager_test.cc"
        "address_unittest.cc"
        "address_with_type_test.cc"
        "class_of_device_unittest.cc"
        "controller_test.cc"
        "device_test.cc"
        "device_database_test.cc"
        "dual_device_test.cc"
        "hci_layer_test.cc"
        "hci_packets_test.cc"
        "le_advertising_manager_test.cc"
        "le_scanning_manager_test.cc"
    ];
};

BluetoothFacade_hci_layer = filegroup {
    name = "BluetoothFacade_hci_layer";
    srcs = [
        "facade/facade.cc"
        "facade/acl_manager_facade.cc"
        "facade/controller_facade.cc"
        "facade/le_acl_manager_facade.cc"
        "facade/le_advertising_manager_facade.cc"
        "facade/le_scanning_manager_facade.cc"
    ];
};

BluetoothHciFuzzTestSources = filegroup {
    name = "BluetoothHciFuzzTestSources";
    srcs = [
        "hci_packets_fuzz_test.cc"
    ];
};

in { inherit BluetoothFacade_hci_layer BluetoothHciFuzzTestSources BluetoothHciSources BluetoothHciTestSources; }