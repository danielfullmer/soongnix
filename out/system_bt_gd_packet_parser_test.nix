{ filegroup, genrule }:
let

BluetoothPacketParserTestPacketPdlGen_h = genrule {
    name = "BluetoothPacketParserTestPacketPdlGen_h";
    tools = [
        "bluetooth_packetgen"
    ];
    cmd = "$(location bluetooth_packetgen) --include=system/bt/gd --out=$(genDir) $(in)";
    srcs = [
        "test_packets.pdl"
        "big_endian_test_packets.pdl"
    ];
    out = [
        "packet/parser/test/test_packets.h"
        "packet/parser/test/big_endian_test_packets.h"
    ];
};

BluetoothPacketParserTestPacketTestSources = filegroup {
    name = "BluetoothPacketParserTestPacketTestSources";
    srcs = [
        "generated_packet_test.cc"
        "six_bytes.cc"
        "variable.cc"
    ];
};

in { inherit BluetoothPacketParserTestPacketPdlGen_h BluetoothPacketParserTestPacketTestSources; }
