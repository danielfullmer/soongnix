{ filegroup }:
let

BluetoothCommonSources = filegroup {
    name = "BluetoothCommonSources";
    srcs = [
        "link_key.cc"
    ];
};

BluetoothCommonTestSources = filegroup {
    name = "BluetoothCommonTestSources";
    srcs = [
        "blocking_queue_unittest.cc"
        "bidi_queue_unittest.cc"
        "observer_registry_test.cc"
        "link_key_unittest.cc"
    ];
};

in { inherit BluetoothCommonSources BluetoothCommonTestSources; }
