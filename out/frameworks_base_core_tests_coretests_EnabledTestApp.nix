{ android_test_helper_app }:
let

EnabledTestApp = android_test_helper_app {
    name = "EnabledTestApp";

    srcs = [
        "src/com/android/frameworks/coretests/enabled_app/DisabledActivity.java"
        "src/com/android/frameworks/coretests/enabled_app/DisabledProvider.java"
        "src/com/android/frameworks/coretests/enabled_app/DisabledReceiver.java"
        "src/com/android/frameworks/coretests/enabled_app/DisabledService.java"
        "src/com/android/frameworks/coretests/enabled_app/EnabledActivity.java"
        "src/com/android/frameworks/coretests/enabled_app/EnabledProvider.java"
        "src/com/android/frameworks/coretests/enabled_app/EnabledReceiver.java"
        "src/com/android/frameworks/coretests/enabled_app/EnabledService.java"
    ];

    sdk_version = "current";
    certificate = "platform";
};

in { inherit EnabledTestApp; }
