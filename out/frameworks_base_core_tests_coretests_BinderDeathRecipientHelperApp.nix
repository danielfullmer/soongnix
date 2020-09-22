{ android_test_helper_app }:
let

BinderDeathRecipientHelperApp1 = android_test_helper_app {
    name = "BinderDeathRecipientHelperApp1";

    srcs = ["src/com/android/frameworks/coretests/bdr_helper_app/TestCommsReceiver.java"];

    sdk_version = "current";
};

BinderDeathRecipientHelperApp2 = android_test_helper_app {
    name = "BinderDeathRecipientHelperApp2";

    srcs = ["src/com/android/frameworks/coretests/bdr_helper_app/TestCommsReceiver.java"];

    sdk_version = "current";

    aaptflags = [
        "--rename-manifest-package com.android.frameworks.coretests.bdr_helper_app2"
    ];
};

in { inherit BinderDeathRecipientHelperApp1 BinderDeathRecipientHelperApp2; }
