{ android_test }:
let

VoiceInteraction = android_test {
    name = "VoiceInteraction";
    srcs = ["**/*.java"];
    platform_apis = true;
};

in { inherit VoiceInteraction; }
