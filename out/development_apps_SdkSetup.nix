{ android_app, prebuilt_etc }:
let

SdkSetup = android_app {
    name = "SdkSetup";
    privileged = true;
    srcs = ["src/com/android/sdksetup/DefaultActivity.java"];
    platform_apis = true;
    certificate = "platform";
    optimize = {
        enabled = false;
    };
    system_ext_specific = true;
    required = ["privapp_whitelist_com.android.sdksetup"];
};

"privapp_whitelist_com.android.sdksetup" = prebuilt_etc {
    name = "privapp_whitelist_com.android.sdksetup";
    system_ext_specific = true;
    sub_dir = "permissions";
    src = "com.android.sdksetup.xml";
    filename_from_src = true;
};

in { inherit "privapp_whitelist_com.android.sdksetup" SdkSetup; }
