{ android_robolectric_test }:
let

# ############################################
#  Messenger Robolectric test target. #
# ############################################

DirectRenderingClusterTests = android_robolectric_test {
    name = "DirectRenderingClusterTests";

    srcs = ["src/android/car/cluster/ImageResolverTest.java"];

    java_resource_dirs = ["config"];

    #  Include the testing libraries
    libs = [
        "android.car"
    ];

    instrumentation_for = "DirectRenderingCluster";
};

in { inherit DirectRenderingClusterTests; }
