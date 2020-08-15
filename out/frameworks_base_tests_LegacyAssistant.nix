{ android_test }:
let

LegacyAssistant = android_test {
    name = "LegacyAssistant";
    srcs = ["src/com/google/android/test/legacyassistant/AssistActivity.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit LegacyAssistant; }
