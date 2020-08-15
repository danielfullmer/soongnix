{ android_test_helper_app }:
let

FrameworksCoreTests_install_complete_package_info = android_test_helper_app {
    name = "FrameworksCoreTests_install_complete_package_info";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = [
        "src/com/android/frameworks/coretests/TestActivity.java"
        "src/com/android/frameworks/coretests/TestProvider.java"
        "src/com/android/frameworks/coretests/TestReceiver.java"
        "src/com/android/frameworks/coretests/TestService.java"
    ];
};

in { inherit FrameworksCoreTests_install_complete_package_info; }
