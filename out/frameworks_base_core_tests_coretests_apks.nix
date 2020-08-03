{ java_defaults }:
let

FrameworksCoreTests_apks_defaults = java_defaults {
    name = "FrameworksCoreTests_apks_defaults";
    sdk_version = "current";

    #  Every package should have a native library
    jni_libs = ["libframeworks_coretests_jni"];
};

in { inherit FrameworksCoreTests_apks_defaults; }
