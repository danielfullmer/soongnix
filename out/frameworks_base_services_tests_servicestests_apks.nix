{ java_defaults }:
let

FrameworksServicesTests_apks_defaults = java_defaults {
    name = "FrameworksServicesTests_apks_defaults";
    sdk_version = "current";

    #  Every package should have a native library
    jni_libs = ["libframeworks_coretests_jni"];
};

in { inherit FrameworksServicesTests_apks_defaults; }
