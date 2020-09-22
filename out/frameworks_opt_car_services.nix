{ cc_library_shared, java_library }:
let

car-frameworks-service = java_library {
    name = "car-frameworks-service";
    installable = true;
    libs = ["services"];
    required = ["libcar-framework-service-jni"];
    srcs = [
        "src/com/android/internal/car/CarServiceHelperService.java"
        "src/com/android/internal/car/ExternalConstants.java"
        "src/com/android/server/wm/CarLaunchParamsModifier.java"
        "src/com/android/internal/car/ICarServiceHelper.aidl"
    ];
    static_libs = [
        "android.hardware.automotive.vehicle-V2.0-java"
        "android.car.internal.event-log-tags"
        "android.car.userlib"
        "android.car.watchdoglib"
        "carwatchdog_aidl_interface-java"
    ];
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
