{ cc_defaults, cc_library_shared, cc_test }:
let

libxcam_defaults = cc_defaults {
    name = "libxcam_defaults";

    cflags = [
        #  XCam Version Num 1.1.0
        "-DXCAM_VERSION=0x110"

        "-fPIC"
        "-W"
        "-Wall"
        "-D_REENTRANT"
        "-Wformat"
        "-Wno-unused-parameter"
        "-Wformat-security"
        "-fstack-protector"
        "-DANDROID"
    ];

    local_include_dirs = [
        "xcore"
        "modules"
    ];
};

#  For libxcam
#  =================================================
libxcam = cc_library_shared {
    name = "libxcam";
    defaults = ["libxcam_defaults"];

    srcs = [
        "xcore/buffer_pool.cpp"
        "xcore/calibration_parser.cpp"
        "xcore/file_handle.cpp"
        "xcore/image_file_handle.cpp"
        "xcore/image_handler.cpp"
        "xcore/surview_fisheye_dewarp.cpp"
        "xcore/thread_pool.cpp"
        "xcore/video_buffer.cpp"
        "xcore/worker.cpp"
        "xcore/xcam_buffer.cpp"
        "xcore/xcam_common.cpp"
        "xcore/xcam_thread.cpp"
        "xcore/xcam_utils.cpp"
        "xcore/interface/blender.cpp"
        "xcore/interface/feature_match.cpp"
        "xcore/interface/geo_mapper.cpp"
        "xcore/interface/stitcher.cpp"

        "modules/soft/soft_blender.cpp"
        "modules/soft/soft_blender_tasks_priv.cpp"
        "modules/soft/soft_copy_task.cpp"
        "modules/soft/soft_geo_mapper.cpp"
        "modules/soft/soft_geo_tasks_priv.cpp"
        "modules/soft/soft_handler.cpp"
        "modules/soft/soft_stitcher.cpp"
        "modules/soft/soft_video_buf_allocator.cpp"
        "modules/soft/soft_worker.cpp"
    ];

    rtti = true;
};

#  For test-soft-image
#  =================================================
test-soft-image = cc_test {
    name = "test-soft-image";
    defaults = ["libxcam_defaults"];

    gtest = false;
    srcs = ["tests/test-soft-image.cpp"];
    shared_libs = ["libxcam"];

    local_include_dirs = ["tests"];
};

in { inherit libxcam libxcam_defaults test-soft-image; }
