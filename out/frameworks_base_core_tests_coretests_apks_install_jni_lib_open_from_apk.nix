{ android_test_helper_app }:
let

FrameworksCoreTests_install_jni_lib_open_from_apk = android_test_helper_app {
    name = "FrameworksCoreTests_install_jni_lib_open_from_apk";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = ["**/*.java"];
};

in { inherit FrameworksCoreTests_install_jni_lib_open_from_apk; }
