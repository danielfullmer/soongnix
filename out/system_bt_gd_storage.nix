{ filegroup }:
let

BluetoothStorageSources = filegroup {
    name = "BluetoothStorageSources";
    srcs = [
        "legacy.cc"
        "legacy_osi_config.cc"
    ];
};

BluetoothStorageTestSources = filegroup {
    name = "BluetoothStorageTestSources";
    srcs = [
        "legacy_test.cc"
        "legacy_osi_config.cc"
    ];
};

in { inherit BluetoothStorageSources BluetoothStorageTestSources; }
