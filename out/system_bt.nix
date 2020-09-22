{ filegroup }:
let

subdirs = [
    "apex"
    "binder"
    "build"
    "btif"
    "btcore"
    "common"
    "audio_a2dp_hw"
    "audio_bluetooth_hw"
    "audio_hal_interface"
    "audio_hearing_aid_hw"
    "gd"
    "hci"
    "utils"
    "device"
    "stack"
    "osi"
    "embdrv"
    "service"
    "include"
    "main"
    "bta"
    "vendor_libs"
    "test"
    "types"
    "udrv"
    "tools"
    "proto"
];

BluetoothTestConfigTemplate = filegroup {
    name = "BluetoothTestConfigTemplate";
    srcs = [
        "AndroidTestTemplate.xml"
    ];
};

in { inherit BluetoothTestConfigTemplate; }
