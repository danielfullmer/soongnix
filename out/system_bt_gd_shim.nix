{ filegroup }:
let

BluetoothShimSources = filegroup {
    name = "BluetoothShimSources";
    srcs = [
        "dumpsys.cc"
        "l2cap.cc"
        "stack.cc"
    ];
};

BluetoothShimTestSources = filegroup {
    name = "BluetoothShimTestSources";
    srcs = [
        "l2cap_test.cc"
    ];
};

in { inherit BluetoothShimSources BluetoothShimTestSources; }
