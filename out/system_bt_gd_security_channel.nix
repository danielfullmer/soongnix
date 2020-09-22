{ filegroup }:
let

BluetoothSecurityChannelSources = filegroup {
    name = "BluetoothSecurityChannelSources";
    srcs = [
        "security_manager_channel.cc"
    ];
};

BluetoothSecurityChannelTestSources = filegroup {
    name = "BluetoothSecurityChannelTestSources";
    srcs = [
        "security_manager_channel_unittest.cc"
    ];
};

in { inherit BluetoothSecurityChannelSources BluetoothSecurityChannelTestSources; }
