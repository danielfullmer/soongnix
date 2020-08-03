{ android_test }:
let

LegacyAssistant = android_test {
    name = "LegacyAssistant";
    srcs = ["**/*.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit LegacyAssistant; }
