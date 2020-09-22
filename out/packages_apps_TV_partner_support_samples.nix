{ android_app }:
let

PartnerSupportSampleTvInput = android_app {
    name = "PartnerSupportSampleTvInput";

    #  Include all java files.
    srcs = [
        "src/com/example/partnersupportsampletvinput/ChannelScanFragment.java"
        "src/com/example/partnersupportsampletvinput/LineupSelectionFragment.java"
        "src/com/example/partnersupportsampletvinput/LocationFragment.java"
        "src/com/example/partnersupportsampletvinput/ResultFragment.java"
        "src/com/example/partnersupportsampletvinput/SampleTvInputService.java"
        "src/com/example/partnersupportsampletvinput/SampleTvInputSetupActivity.java"
        "src/com/example/partnersupportsampletvinput/WelcomeFragment.java"
    ];

    static_libs = [
        "androidx.leanback_leanback"
        "androidx.tvprovider_tvprovider"
        "live-channels-partner-support"
    ];

    optimize = {
        enabled = false;
    };
    #  Overlay view related functionality requires system APIs.
    sdk_version = "system_current";
    min_sdk_version = "23"; #  M

    #  Required for com.android.tv.permission.RECEIVE_INPUT_EVENT
    privileged = true;

    resource_dirs = ["res"];

};

in { inherit PartnerSupportSampleTvInput; }
