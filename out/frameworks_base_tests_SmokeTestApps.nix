{ android_test }:
let

SmokeTestTriggerApps = android_test {
    name = "SmokeTestTriggerApps";
    srcs = [
        "src/com/android/smoketest/triggers/CrashyApp.java"
        "src/com/android/smoketest/triggers/CrashyApp2.java"
        "src/com/android/smoketest/triggers/UnresponsiveApp.java"
    ];
    sdk_version = "current";
};

in { inherit SmokeTestTriggerApps; }
