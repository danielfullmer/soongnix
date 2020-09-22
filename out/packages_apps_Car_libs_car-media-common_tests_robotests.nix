{ android_app, android_robolectric_test }:
let



# ###########################################################
#  CarMediaCommon app just for Robolectric test target.     #
# ###########################################################
CarMediaCommon = android_app {
    name = "CarMediaCommon";

    platform_apis = true;

    privileged = true;

    static_libs = [
        "car-arch-common"
        "car-media-common"
    ];
};

# ###############################################
#  Car Media Common Robolectric test target. #
# ###############################################
CarMediaCommonRoboTests = android_robolectric_test {
    name = "CarMediaCommonRoboTests";

    srcs = [
        "src/com/android/car/media/common/MediaItemMetadataTest.java"
        "src/com/android/car/media/common/playback/PlaybackViewModelTest.java"
        "src/com/android/car/media/common/playback/ProgressLiveDataTest.java"
        "src/com/android/car/media/common/source/MediaBrowserConnectorTest.java"
        "src/com/android/car/media/common/source/MediaSourceViewModelTest.java"
        "src/com/android/car/media/common/source/MediaSourcesLiveDataTest.java"
    ];

    java_resource_dirs = ["config"];

    #  Include the testing libraries
    libs = [
        "android.car"
        "androidx.arch.core_core-runtime"
        "androidx.arch.core_core-common"
    ];

    instrumentation_for = "CarMediaCommon";
};

in { inherit CarMediaCommon CarMediaCommonRoboTests; }
