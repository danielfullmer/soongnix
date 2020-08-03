{ android_test }:
let

AccessibilityEventsLogger = android_test {
    name = "AccessibilityEventsLogger";
    srcs = ["**/*.java"];
    sdk_version = "current";
    certificate = "platform";
    optimize = {
        enabled = false;
    };
};

in { inherit AccessibilityEventsLogger; }
