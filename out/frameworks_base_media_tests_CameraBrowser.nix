{ android_test }:
let

CameraBrowser = android_test {
    name = "CameraBrowser";
    srcs = ["**/*.java"];
    sdk_version = "current";
};

in { inherit CameraBrowser; }
