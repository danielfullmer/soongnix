{ android_app }:
let

VoiceEnrollment = android_app {
    name = "VoiceEnrollment";
    srcs = ["**/*.java"];
    platform_apis = true;
    privileged = true;
};

in { inherit VoiceEnrollment; }
