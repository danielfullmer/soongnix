{ filegroup }:
let

"IMidiDeviceServer.aidl" = filegroup {
    name = "IMidiDeviceServer.aidl";
    srcs = ["android/media/midi/IMidiDeviceServer.aidl"];
};

in { inherit "IMidiDeviceServer.aidl"; }
