{ filegroup }:
let

BluetoothCryptoToolboxSources = filegroup {
    name = "BluetoothCryptoToolboxSources";
    srcs = [
        "aes.cc"
        "aes_cmac.cc"
        "crypto_toolbox.cc"
    ];
};

BluetoothCryptoToolboxTestSources = filegroup {
    name = "BluetoothCryptoToolboxTestSources";
    srcs = [
        "crypto_toolbox_test.cc"
    ];
};

in { inherit BluetoothCryptoToolboxSources BluetoothCryptoToolboxTestSources; }
