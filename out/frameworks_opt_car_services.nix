{ cc_library_shared, java_library }:
let

car-frameworks-service = java_library {
    name = "car-frameworks-service";
    installable = true;
    libs = ["services"];
    # LOCAL_PACKAGE_NAME := CarFrameworkService
    required = ["libcar-framework-service-jni"];
    srcs = [
        "src/**/*.java"
        "src/com/android/internal/car/ICarServiceHelper.aidl"
    ];
    static_libs = ["android.car.userlib"];
};

libcar-framework-service-jni = cc_library_shared {
    name = "libcar-framework-service-jni";
    shared_libs = [
        "libandroid_runtime"
        "libhidlbase"
        "liblog"
        "libnativehelper"
        "libsuspend"
        "libutils"
    ];
    srcs = ["src/jni/com_android_internal_car_CarServiceHelperService.cpp"];
};

in { inherit car-frameworks-service libcar-framework-service-jni; }
