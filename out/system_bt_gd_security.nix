{ filegroup }:
let

BluetoothSecuritySources = filegroup {
    name = "BluetoothSecuritySources";
    srcs = [
        "ecc/multprecision.cc"
        "ecc/p_256_ecc_pp.cc"
        "ecdh_keys.cc"
        "pairing_handler_le.cc"
        "pairing_handler_le_legacy.cc"
        "pairing_handler_le_secure_connections.cc"
        "security_manager.cc"
        "internal/security_manager_impl.cc"
        "security_module.cc"
        ":BluetoothSecurityChannelSources"
        ":BluetoothSecurityPairingSources"
    ];
};

BluetoothSecurityTestSources = filegroup {
    name = "BluetoothSecurityTestSources";
    srcs = [
        "ecc/multipoint_test.cc"
        "pairing_handler_le_unittest.cc"
        "test/ecdh_keys_test.cc"
        "test/fake_l2cap_test.cc"
        "test/pairing_handler_le_pair_test.cc"
        ":BluetoothSecurityChannelTestSources"
        ":BluetoothSecurityPairingTestSources"
    ];
};

BluetoothFacade_security_layer = filegroup {
    name = "BluetoothFacade_security_layer";
    srcs = [
        "facade.cc"
    ];
};

in { inherit BluetoothFacade_security_layer BluetoothSecuritySources BluetoothSecurityTestSources; }
