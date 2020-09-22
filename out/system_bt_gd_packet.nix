{ filegroup }:
let

BluetoothPacketSources = filegroup {
    name = "BluetoothPacketSources";
    srcs = [
        "bit_inserter.cc"
        "byte_inserter.cc"
        "byte_observer.cc"
        "iterator.cc"
        "fragmenting_inserter.cc"
        "packet_view.cc"
        "raw_builder.cc"
        "view.cc"
    ];
};

BluetoothPacketTestSources = filegroup {
    name = "BluetoothPacketTestSources";
    srcs = [
        "bit_inserter_unittest.cc"
        "fragmenting_inserter_unittest.cc"
        "packet_builder_unittest.cc"
        "packet_view_unittest.cc"
        "raw_builder_unittest.cc"
    ];
};

in { inherit BluetoothPacketSources BluetoothPacketTestSources; }
