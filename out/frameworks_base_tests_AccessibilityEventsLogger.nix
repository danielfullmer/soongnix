{ android_test }:
let

AccessibilityEventsLogger = android_test {
    name = "AccessibilityEventsLogger";
    srcs = ["src/com/android/tests/accessibilityeventlogger/AELogger.java"];
    sdk_version = "current";
    certificate = "platform";
    optimize = {
        enabled = false;
    };
};

in { inherit AccessibilityEventsLogger; }
