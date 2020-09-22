{ filegroup }:
let

BluetoothAttSources = filegroup {
    name = "BluetoothAttSources";
    srcs = [
        "att_module.cc"
    ];
};

BluetoothAttTestSources = filegroup {
    name = "BluetoothAttTestSources";
    srcs = [
    ];
};

in { inherit BluetoothAttSources BluetoothAttTestSources; }
