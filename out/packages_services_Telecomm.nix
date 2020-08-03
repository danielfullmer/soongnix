{ android_app, android_test }:
let

#  Build the Telecom service.
Telecom = android_app {
    name = "Telecom";
    libs = ["telephony-common"];
    srcs = [
        "src/**/*.java"
        "proto/**/*.proto"
    ];
    resource_dirs = ["res"];
    proto = {
        type = "nano";
        local_include_dirs = ["proto/"];
        output_params = ["optional_field_style=accessors"];
    };
    platform_apis = true;
    certificate = "platform";
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    defaults = ["SettingsLibDefaults"];
};

TelecomUnitTests = android_test {
    name = "TelecomUnitTests";
    static_libs = [
        "android-ex-camera2"
        "guava"
        "mockito-target-inline"
        "androidx.test.rules"
        "platform-test-annotations"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.core_core"
        "androidx.fragment_fragment"
    ];
    srcs = [
        "tests/src/**/*.java"
        "src/**/*.java"
        "proto/**/*.proto"
    ];
    proto = {
        type = "nano";
        local_include_dirs = ["proto/"];
        output_params = ["optional_field_style=accessors"];
    };
    resource_dirs = [
        "tests/res"
        "res"
    ];
    libs = [
        "android.test.mock"
        "android.test.base"
        "android.test.runner"
        "telephony-common"
    ];

    jni_libs = ["libdexmakerjvmtiagent"];

    aaptflags = [
        "--auto-add-overlay"
        "--extra-packages"
        "com.android.server.telecom"
    ];
    manifest = "tests/AndroidManifest.xml";
    optimize = {
        enabled = false;
    };
    platform_apis = true;
    certificate = "platform";
    jacoco = {
        include_filter = ["com.android.server.telecom.*"];
        exclude_filter = ["com.android.server.telecom.tests.*"];
    };
    test_suites = ["device-tests"];
    defaults = ["SettingsLibDefaults"];
};

in { inherit Telecom TelecomUnitTests; }
