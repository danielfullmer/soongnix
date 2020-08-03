{ filegroup }:
let

BluetoothCommonSources = filegroup {
    name = "BluetoothCommonSources";
    srcs = [
        "address.cc"
        "class_of_device.cc"
    ];
};

BluetoothCommonTestSources = filegroup {
    name = "BluetoothCommonTestSources";
    srcs = [
        "address_unittest.cc"
        "class_of_device_unittest.cc"
    ];
};

in { inherit BluetoothCommonSources BluetoothCommonTestSources; }
