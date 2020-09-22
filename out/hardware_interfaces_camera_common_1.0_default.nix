{ cc_library_static }:
let

"android.hardware.camera.common@1.0-helper" = cc_library_static {
    name = "android.hardware.camera.common@1.0-helper";
    vendor_available = true;
    defaults = ["hidl_defaults"];
    srcs = [
        "CameraModule.cpp"
        "CameraMetadata.cpp"
        "CameraParameters.cpp"
        "VendorTagDescriptor.cpp"
        "HandleImporter.cpp"
        "Exif.cpp"
    ];
    cflags = [
        "-Werror"
        "-Wextra"
        "-Wall"
    ];
    shared_libs = [
        "liblog"
        "libgralloctypes"
        "libhardware"
        "libcamera_metadata"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
        "android.hardware.graphics.mapper@4.0"
        "libexif"
    ];
    include_dirs = ["system/media/private/camera/include"];
    export_include_dirs = ["include"];
};

in { inherit "android.hardware.camera.common@1.0-helper"; }
