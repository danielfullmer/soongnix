{ java_library }:
let

#  Job Scheduler Service jar, which will eventually be put in the jobscheduler mainline apex.
#  service-jobscheduler needs to be added to PRODUCT_SYSTEM_SERVER_JARS.
service-jobscheduler = java_library {
    name = "service-jobscheduler";
    installable = true;

    srcs = [
        "java/com/android/server/AnyMotionDetector.java"
        "java/com/android/server/DeviceIdleController.java"
        "java/com/android/server/deviceidle/BluetoothConstraint.java"
        "java/com/android/server/deviceidle/DeviceIdleConstraintTracker.java"
        "java/com/android/server/deviceidle/TvConstraintController.java"
        "java/com/android/server/job/GrantedUriPermissions.java"
        "java/com/android/server/job/JobCompletedListener.java"
        "java/com/android/server/job/JobConcurrencyManager.java"
        "java/com/android/server/job/JobPackageTracker.java"
        "java/com/android/server/job/JobSchedulerService.java"
        "java/com/android/server/job/JobSchedulerShellCommand.java"
        "java/com/android/server/job/JobServiceContext.java"
        "java/com/android/server/job/JobStore.java"
        "java/com/android/server/job/StateChangedListener.java"
        "java/com/android/server/job/controllers/BackgroundJobsController.java"
        "java/com/android/server/job/controllers/BatteryController.java"
        "java/com/android/server/job/controllers/ConnectivityController.java"
        "java/com/android/server/job/controllers/ContentObserverController.java"
        "java/com/android/server/job/controllers/DeviceIdleJobsController.java"
        "java/com/android/server/job/controllers/IdleController.java"
        "java/com/android/server/job/controllers/JobStatus.java"
        "java/com/android/server/job/controllers/QuotaController.java"
        "java/com/android/server/job/controllers/RestrictingController.java"
        "java/com/android/server/job/controllers/StateController.java"
        "java/com/android/server/job/controllers/StorageController.java"
        "java/com/android/server/job/controllers/TimeController.java"
        "java/com/android/server/job/controllers/idle/CarIdlenessTracker.java"
        "java/com/android/server/job/controllers/idle/DeviceIdlenessTracker.java"
        "java/com/android/server/job/controllers/idle/IdlenessListener.java"
        "java/com/android/server/job/controllers/idle/IdlenessTracker.java"
        "java/com/android/server/job/restrictions/JobRestriction.java"
        "java/com/android/server/job/restrictions/ThermalStatusRestriction.java"
        "java/com/android/server/usage/AppIdleHistory.java"
        "java/com/android/server/usage/AppStandbyController.java"
    ];

    libs = [
        "app-compat-annotations"
        "framework"
        "services.core"
    ];
};

in { inherit service-jobscheduler; }
