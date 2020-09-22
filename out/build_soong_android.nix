{ bootstrap_go_package }:
let

soong-android = bootstrap_go_package {
    name = "soong-android";
    pkgPath = "android/soong/android";
    deps = [
        "blueprint"
        "blueprint-bootstrap"
        "soong"
        "soong-android-soongconfig"
        "soong-env"
        "soong-shared"
    ];
    srcs = [
        "androidmk.go"
        "apex.go"
        "api_levels.go"
        "arch.go"
        "config.go"
        "csuite_config.go"
        "defaults.go"
        "defs.go"
        "depset.go"
        "expand.go"
        "filegroup.go"
        "hooks.go"
        "image.go"
        "makevars.go"
        "module.go"
        "mutator.go"
        "namespace.go"
        "neverallow.go"
        "notices.go"
        "onceper.go"
        "override_module.go"
        "package.go"
        "package_ctx.go"
        "path_properties.go"
        "paths.go"
        "phony.go"
        "prebuilt.go"
        "proto.go"
        "register.go"
        "rule_builder.go"
        "sandbox.go"
        "sdk.go"
        "singleton.go"
        "soong_config_modules.go"
        "testing.go"
        "util.go"
        "variable.go"
        "visibility.go"
        "vts_config.go"
        "writedocs.go"

        #  Lock down environment access last
        "env.go"
    ];
    testSrcs = [
        "android_test.go"
        "androidmk_test.go"
        "arch_test.go"
        "config_test.go"
        "csuite_config_test.go"
        "depset_test.go"
        "expand_test.go"
        "module_test.go"
        "mutator_test.go"
        "namespace_test.go"
        "neverallow_test.go"
        "onceper_test.go"
        "package_test.go"
        "path_properties_test.go"
        "paths_test.go"
        "prebuilt_test.go"
        "rule_builder_test.go"
        "soong_config_modules_test.go"
        "util_test.go"
        "variable_test.go"
        "visibility_test.go"
        "vts_config_test.go"
    ];
};

in { inherit soong-android; }
