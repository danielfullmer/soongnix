{ android_test_helper_app }:
let

FrameworksServicesTests_install_uses_sdk_r0 = android_test_helper_app {
    name = "FrameworksServicesTests_install_uses_sdk_r0";
    defaults = ["FrameworksServicesTests_apks_defaults"];
    manifest = "AndroidManifest-r0.xml";

    srcs = [];
};

FrameworksServicesTests_install_uses_sdk_r5 = android_test_helper_app {
    name = "FrameworksServicesTests_install_uses_sdk_r5";
    defaults = ["FrameworksServicesTests_apks_defaults"];
    manifest = "AndroidManifest-r5.xml";

    srcs = [];
};

FrameworksServicesTests_install_uses_sdk_q0 = android_test_helper_app {
    name = "FrameworksServicesTests_install_uses_sdk_q0";
    defaults = ["FrameworksServicesTests_apks_defaults"];
    manifest = "AndroidManifest-q0.xml";

    srcs = [];
};

FrameworksServicesTests_install_uses_sdk_r = android_test_helper_app {
    name = "FrameworksServicesTests_install_uses_sdk_r";
    defaults = ["FrameworksServicesTests_apks_defaults"];
    manifest = "AndroidManifest-r.xml";

    srcs = [];
};

FrameworksServicesTests_install_uses_sdk_0 = android_test_helper_app {
    name = "FrameworksServicesTests_install_uses_sdk_0";
    defaults = ["FrameworksServicesTests_apks_defaults"];
    manifest = "AndroidManifest-0.xml";

    srcs = [];
};

in { inherit FrameworksServicesTests_install_uses_sdk_0 FrameworksServicesTests_install_uses_sdk_q0 FrameworksServicesTests_install_uses_sdk_r FrameworksServicesTests_install_uses_sdk_r0 FrameworksServicesTests_install_uses_sdk_r5; }
