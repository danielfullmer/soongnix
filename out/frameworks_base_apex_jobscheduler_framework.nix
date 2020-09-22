{ filegroup, java_library }:
let

framework-jobscheduler-sources = filegroup {
    name = "framework-jobscheduler-sources";
    srcs = [
        "java/android/app/JobSchedulerImpl.java"
        "java/android/app/job/JobInfo.java"
        "java/android/app/job/JobParameters.java"
        "java/android/app/job/JobScheduler.java"
        "java/android/app/job/JobSchedulerFrameworkInitializer.java"
        "java/android/app/job/JobService.java"
        "java/android/app/job/JobServiceEngine.java"
        "java/android/app/job/JobSnapshot.java"
        "java/android/app/job/JobWorkItem.java"
        "java/android/os/DeviceIdleManager.java"
        "java/android/os/PowerWhitelistManager.java"
        "java/com/android/server/DeviceIdleInternal.java"
        "java/com/android/server/deviceidle/ConstraintController.java"
        "java/com/android/server/deviceidle/IDeviceIdleConstraint.java"
        "java/com/android/server/job/JobSchedulerInternal.java"
        "java/com/android/server/usage/AppStandbyInternal.java"
        "java/android/app/job/IJobCallback.aidl"
        "java/android/app/job/IJobScheduler.aidl"
        "java/android/app/job/IJobService.aidl"
        "java/android/os/IDeviceIdleController.aidl"
    ];
    path = "java";
};

framework-jobscheduler = java_library {
    name = "framework-jobscheduler";
    installable = false;
    compile_dex = true;
    sdk_version = "core_platform";
    srcs = [
        ":framework-jobscheduler-sources"
    ];
    aidl = {
        export_include_dirs = [
            "java"
        ];
    };
    libs = [
        "framework-minus-apex"
        "unsupportedappusage"
    ];
};

in { inherit framework-jobscheduler framework-jobscheduler-sources; }
