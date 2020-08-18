{ cc_binary, cc_defaults, cc_library_shared }:
let

"android.hardware.camera.provider@2.4-legacy" = cc_library_shared {
    name = "android.hardware.camera.provider@2.4-legacy";
    defaults = ["hidl_defaults"];
    proprietary = true;
    srcs = ["LegacyCameraProviderImpl_2_4.cpp"];
    shared_libs = [
        "android.hardware.camera.common@1.0"
        "android.hardware.camera.device@1.0"
        "android.hardware.camera.device@3.2"
        "android.hardware.camera.device@3.3"
        "android.hardware.camera.device@3.4"
        "android.hardware.camera.device@3.5"
        "android.hardware.camera.provider@2.4"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "camera.device@1.0-impl"
        "camera.device@3.2-impl"
        "camera.device@3.3-impl"
        "camera.device@3.4-impl"
        "camera.device@3.5-impl"
        "libcamera_metadata"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "android.hardware.camera.common@1.0-helper"
    ];
    header_libs = [
        "camera.device@3.4-impl_headers"
        "camera.device@3.5-impl_headers"
    ];
    export_include_dirs = ["."];
};

"android.hardware.camera.provider@2.4-external" = cc_library_shared {
    name = "android.hardware.camera.provider@2.4-external";
    proprietary = true;
    srcs = ["ExternalCameraProviderImpl_2_4.cpp"];
    shared_libs = [
        "android.hardware.camera.common@1.0"
        "android.hardware.camera.device@1.0"
        "android.hardware.camera.device@3.2"
        "android.hardware.camera.device@3.3"
        "android.hardware.camera.device@3.4"
        "android.hardware.camera.device@3.5"
        "android.hardware.camera.provider@2.4"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "camera.device@3.3-impl"
        "camera.device@3.4-external-impl"
        "camera.device@3.4-impl"
        "camera.device@3.5-external-impl"
        "camera.device@3.5-impl"
        "libcamera_metadata"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libtinyxml2"
        "libutils"
    ];
    static_libs = [
        "android.hardware.camera.common@1.0-helper"
    ];
    header_libs = [
        "camera.device@3.4-external-impl_headers"
        "camera.device@3.5-external-impl_headers"
    ];
    export_include_dirs = ["."];
};

"android.hardware.camera.provider@2.4-impl" = cc_library_shared {
    name = "android.hardware.camera.provider@2.4-impl";
    defaults = ["hidl_defaults"];
    proprietary = true;
    relative_install_path = "hw";
    srcs = ["CameraProvider_2_4.cpp"];
    shared_libs = [
        "android.hardware.camera.common@1.0"
        "android.hardware.camera.device@1.0"
        "android.hardware.camera.device@3.2"
        "android.hardware.camera.device@3.3"
        "android.hardware.camera.device@3.4"
        "android.hardware.camera.device@3.5"
        "android.hardware.camera.provider@2.4"
        "android.hardware.camera.provider@2.4-external"
        "android.hardware.camera.provider@2.4-legacy"
        "android.hardware.graphics.mapper@2.0"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "camera.device@1.0-impl"
        "camera.device@3.2-impl"
        "camera.device@3.3-impl"
        "camera.device@3.4-external-impl"
        "camera.device@3.4-impl"
        "camera.device@3.5-external-impl"
        "camera.device@3.5-impl"
        "libcamera_metadata"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libtinyxml2"
        "libutils"
    ];
    header_libs = [
        "camera.device@3.4-external-impl_headers"
        "camera.device@3.4-impl_headers"
        "camera.device@3.5-external-impl_headers"
        "camera.device@3.5-impl_headers"
    ];
    static_libs = [
        "android.hardware.camera.common@1.0-helper"
    ];
    export_include_dirs = ["."];
};

camera_service_defaults = cc_defaults {
    name = "camera_service_defaults";
    defaults = ["hidl_defaults"];
    proprietary = true;
    relative_install_path = "hw";
    srcs = ["service.cpp"];
    shared_libs = [
        "android.hardware.camera.common@1.0"
        "android.hardware.camera.device@1.0"
        "android.hardware.camera.device@3.2"
        "android.hardware.camera.device@3.3"
        "android.hardware.camera.device@3.4"
        "android.hardware.camera.device@3.5"
        "android.hardware.camera.provider@2.4"
        "android.hardware.graphics.mapper@2.0"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libbinder"
        "libcamera_metadata"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "android.hardware.camera.common@1.0-helper"
    ];
    header_libs = [
        "camera.device@3.4-external-impl_headers"
        "camera.device@3.4-impl_headers"
        "camera.device@3.5-external-impl_headers"
        "camera.device@3.5-impl_headers"
    ];
};

"android.hardware.camera.provider@2.4-service" = cc_binary {
    name = "android.hardware.camera.provider@2.4-service";
    defaults = ["camera_service_defaults"];
    compile_multilib = "32";
    init_rc = ["android.hardware.camera.provider@2.4-service.rc"];
};

"android.hardware.camera.provider@2.4-service_64" = cc_binary {
    name = "android.hardware.camera.provider@2.4-service_64";
    defaults = ["camera_service_defaults"];
    compile_multilib = "64";
    init_rc = ["android.hardware.camera.provider@2.4-service_64.rc"];
};

"android.hardware.camera.provider@2.4-service-lazy" = cc_binary {
    name = "android.hardware.camera.provider@2.4-service-lazy";
    overrides = ["android.hardware.camera.provider@2.4-service"];
    defaults = ["camera_service_defaults"];
    compile_multilib = "32";
    init_rc = ["android.hardware.camera.provider@2.4-service-lazy.rc"];
    cflags = ["-DLAZY_SERVICE"];
};

"android.hardware.camera.provider@2.4-service-lazy_64" = cc_binary {
    name = "android.hardware.camera.provider@2.4-service-lazy_64";
    overrides = ["android.hardware.camera.provider@2.4-service_64"];
    defaults = ["camera_service_defaults"];
    compile_multilib = "64";
    init_rc = ["android.hardware.camera.provider@2.4-service-lazy_64.rc"];
    cflags = ["-DLAZY_SERVICE"];
};

"android.hardware.camera.provider@2.4-external-service" = cc_binary {
    name = "android.hardware.camera.provider@2.4-external-service";
    defaults = ["hidl_defaults"];
    proprietary = true;
    relative_install_path = "hw";
    srcs = ["external-service.cpp"];
    compile_multilib = "32";
    init_rc = ["android.hardware.camera.provider@2.4-external-service.rc"];
    shared_libs = [
        "android.hardware.camera.common@1.0"
        "android.hardware.camera.device@1.0"
        "android.hardware.camera.device@3.2"
        "android.hardware.camera.device@3.3"
        "android.hardware.camera.device@3.4"
        "android.hardware.camera.device@3.5"
        "android.hardware.camera.provider@2.4"
        "libbinder"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libtinyxml2"
        "libutils"
    ];
    header_libs = [
        "camera.device@3.4-external-impl_headers"
        "camera.device@3.4-impl_headers"
        "camera.device@3.5-external-impl_headers"
        "camera.device@3.5-impl_headers"
    ];
};

in { inherit "android.hardware.camera.provider@2.4-external" "android.hardware.camera.provider@2.4-external-service" "android.hardware.camera.provider@2.4-impl" "android.hardware.camera.provider@2.4-legacy" "android.hardware.camera.provider@2.4-service" "android.hardware.camera.provider@2.4-service-lazy" "android.hardware.camera.provider@2.4-service-lazy_64" "android.hardware.camera.provider@2.4-service_64" camera_service_defaults; }