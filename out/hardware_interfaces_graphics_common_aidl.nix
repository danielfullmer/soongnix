{ aidl_interface }:
let

"android.hardware.graphics.common" = aidl_interface {
    name = "android.hardware.graphics.common";
    host_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    srcs = [
        "android/hardware/graphics/common/BlendMode.aidl"
        "android/hardware/graphics/common/BufferUsage.aidl"
        "android/hardware/graphics/common/ChromaSiting.aidl"
        "android/hardware/graphics/common/Compression.aidl"
        "android/hardware/graphics/common/Cta861_3.aidl"
        "android/hardware/graphics/common/Dataspace.aidl"
        "android/hardware/graphics/common/ExtendableType.aidl"
        "android/hardware/graphics/common/HardwareBuffer.aidl"
        "android/hardware/graphics/common/HardwareBufferDescription.aidl"
        "android/hardware/graphics/common/Interlaced.aidl"
        "android/hardware/graphics/common/PixelFormat.aidl"
        "android/hardware/graphics/common/PlaneLayout.aidl"
        "android/hardware/graphics/common/PlaneLayoutComponent.aidl"
        "android/hardware/graphics/common/PlaneLayoutComponentType.aidl"
        "android/hardware/graphics/common/Rect.aidl"
        "android/hardware/graphics/common/Smpte2086.aidl"
        "android/hardware/graphics/common/StandardMetadataType.aidl"
        "android/hardware/graphics/common/XyColor.aidl"
    ];
    stability = "vintf";
    imports = [
        "android.hardware.common"
    ];
    backend = {
        java = {
            enabled = false;
        };
        cpp = {
            enabled = false;
        };
        ndk = {
            apex_available = [
                "//apex_available:platform"
                "com.android.media.swcodec"
            ];
            min_sdk_version = "29";
        };
    };
    versions = ["1"];
};

in { inherit "android.hardware.graphics.common"; }
