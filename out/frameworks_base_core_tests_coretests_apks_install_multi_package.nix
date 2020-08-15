{ android_test_helper_app }:
let

FrameworksCoreTests_install_multi_package = android_test_helper_app {
    name = "FrameworksCoreTests_install_multi_package";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = [
        "src/com/android/frameworks/coretests/FirstChildTestActivity.java"
        "src/com/android/frameworks/coretests/FirstChildTestProvider.java"
        "src/com/android/frameworks/coretests/FirstChildTestReceiver.java"
        "src/com/android/frameworks/coretests/FirstChildTestService.java"
        "src/com/android/frameworks/coretests/SecondChildTestActivity.java"
        "src/com/android/frameworks/coretests/SecondChildTestProvider.java"
        "src/com/android/frameworks/coretests/SecondChildTestReceiver.java"
        "src/com/android/frameworks/coretests/SecondChildTestService.java"
        "src/com/android/frameworks/coretests/TestActivity.java"
        "src/com/android/frameworks/coretests/TestProvider.java"
        "src/com/android/frameworks/coretests/TestReceiver.java"
        "src/com/android/frameworks/coretests/TestService.java"
    ];
};

in { inherit FrameworksCoreTests_install_multi_package; }
