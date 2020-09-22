{ filegroup }:
let

BluetoothSecurityPairingSources = filegroup {
    name = "BluetoothSecurityPairingSources";
    srcs = [
        "classic_pairing_handler.cc"
    ];
};

BluetoothSecurityPairingTestSources = filegroup {
    name = "BluetoothSecurityPairingTestSources";
    srcs = [
        "classic_pairing_handler_unittest.cc"
    ];
};

in { inherit BluetoothSecurityPairingSources BluetoothSecurityPairingTestSources; }
