{ cc_test }:
let

#  Build the unit tests.
camera_metadata_tests = cc_test {
    name = "camera_metadata_tests";
    srcs = ["camera_metadata_tests.cpp"];
    test_suites = ["device-tests"];

    shared_libs = [
        "libutils"
        "libcamera_metadata"
    ];

    include_dirs = ["system/media/private/camera/include"];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    multilib = {
        lib32 = {
            stem = "camera_metadata_tests";
        };
        lib64 = {
            stem = "camera_metadata_tests64";
        };
    };
};

in { inherit camera_metadata_tests; }
