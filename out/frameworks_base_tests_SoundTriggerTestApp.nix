{ android_app }:
let

SoundTriggerTestApp = android_app {
    name = "SoundTriggerTestApp";
    srcs = ["**/*.java"];
    platform_apis = true;
    privileged = true;
    certificate = "platform";
};

in { inherit SoundTriggerTestApp; }
