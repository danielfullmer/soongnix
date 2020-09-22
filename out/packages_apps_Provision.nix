{ android_app }:
let

Provision = android_app {
    name = "Provision";
    srcs = ["src/com/android/provision/DefaultActivity.java"];
    platform_apis = true;
    system_ext_specific = true;
    certificate = "platform";
    privileged = true;
    required = ["privapp_whitelist_com.android.provision"];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit Provision; }
