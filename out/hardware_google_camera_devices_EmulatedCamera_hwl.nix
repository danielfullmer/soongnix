{ cc_library_shared }:
let

libgooglecamerahwl_impl = cc_library_shared {
    name = "libgooglecamerahwl_impl";
    owner = "google";
    proprietary = true;
    srcs = [
        "EmulatedCameraProviderHWLImpl.cpp"
        "EmulatedCameraDeviceHWLImpl.cpp"
        "EmulatedCameraDeviceSessionHWLImpl.cpp"
        "EmulatedLogicalRequestState.cpp"
        "EmulatedRequestProcessor.cpp"
        "EmulatedRequestState.cpp"
        "EmulatedScene.cpp"
        "EmulatedSensor.cpp"
        "EmulatedTorchState.cpp"
        "JpegCompressor.cpp"
        "utils/ExifUtils.cpp"
        "utils/HWLUtils.cpp"
        "utils/StreamConfigurationMap.cpp"
    ];
    cflags = [
        "-Werror"
        "-Wextra"
        "-Wall"
    ];
    shared_libs = [
        "android.frameworks.sensorservice@1.0"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
        "android.hardware.graphics.mapper@4.0"
        "android.hardware.camera.provider@2.4"
        "android.hardware.camera.provider@2.5"
        "android.hardware.camera.provider@2.6"
        "android.hardware.sensors@1.0"
        "android.hidl.allocator@1.0"
        "libbase"
        "libcamera_metadata"
        "libcutils"
        "libexif"
        "libgralloctypes"
        "libhardware"
        "libhidlbase"
        "libgooglecamerahalutils"
        "libjpeg"
        "libjsoncpp"
        "liblog"
        "libsync"
        "libutils"
        "libyuv"
    ];
    static_libs = [
        "android.hardware.camera.common@1.0-helper"
    ];
    include_dirs = [
        "system/media/private/camera/include"
    ];
    header_libs = [
        "libgooglecamerahal_headers"
    ];
};

in { inherit libgooglecamerahwl_impl; }
