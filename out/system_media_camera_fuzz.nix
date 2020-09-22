{ cc_fuzz }:
let

libcamera_metadata_fuzzer = cc_fuzz {
    name = "libcamera_metadata_fuzzer";
    srcs = [
        "libcamera_metadata_fuzzer.cpp"
    ];
    shared_libs = [
        "libutils"
        "libcamera_metadata"
    ];
    include_dirs = ["system/media/private/camera/include"];
};

in { inherit libcamera_metadata_fuzzer; }
