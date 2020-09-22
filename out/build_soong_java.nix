{ bootstrap_go_package }:
let

soong-java = bootstrap_go_package {
    name = "soong-java";
    pkgPath = "android/soong/java";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "soong"
        "soong-android"
        "soong-cc"
        "soong-dexpreopt"
        "soong-genrule"
        "soong-java-config"
        "soong-remoteexec"
        "soong-tradefed"
    ];
    srcs = [
        "aapt2.go"
        "aar.go"
        "android_manifest.go"
        "android_resources.go"
        "androidmk.go"
        "app_builder.go"
        "app.go"
        "builder.go"
        "device_host_converter.go"
        "dex.go"
        "dexpreopt.go"
        "dexpreopt_bootjars.go"
        "dexpreopt_config.go"
        "droiddoc.go"
        "gen.go"
        "genrule.go"
        "hiddenapi.go"
        "hiddenapi_singleton.go"
        "jacoco.go"
        "java.go"
        "jdeps.go"
        "java_resources.go"
        "kotlin.go"
        "lint.go"
        "platform_compat_config.go"
        "plugin.go"
        "prebuilt_apis.go"
        "proto.go"
        "robolectric.go"
        "sdk.go"
        "sdk_library.go"
        "support_libraries.go"
        "sysprop.go"
        "system_modules.go"
        "testing.go"
        "tradefed.go"
    ];
    testSrcs = [
        "androidmk_test.go"
        "app_test.go"
        "device_host_converter_test.go"
        "dexpreopt_test.go"
        "dexpreopt_bootjars_test.go"
        "java_test.go"
        "jdeps_test.go"
        "kotlin_test.go"
        "plugin_test.go"
        "sdk_test.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-java; }