{ filegroup, java_library_static }:
let

"services.usage-sources" = filegroup {
    name = "services.usage-sources";
    srcs = [
        "java/com/android/server/usage/AppTimeLimitController.java"
        "java/com/android/server/usage/IntervalStats.java"
        "java/com/android/server/usage/PackagesTokenData.java"
        "java/com/android/server/usage/StorageStatsManagerInternal.java"
        "java/com/android/server/usage/StorageStatsService.java"
        "java/com/android/server/usage/UnixCalendar.java"
        "java/com/android/server/usage/UsageStatsDatabase.java"
        "java/com/android/server/usage/UsageStatsIdleService.java"
        "java/com/android/server/usage/UsageStatsProto.java"
        "java/com/android/server/usage/UsageStatsProtoV2.java"
        "java/com/android/server/usage/UsageStatsService.java"
        "java/com/android/server/usage/UsageStatsXml.java"
        "java/com/android/server/usage/UsageStatsXmlV1.java"
        "java/com/android/server/usage/UserUsageStatsService.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.usage" = java_library_static {
    name = "services.usage";
    defaults = ["services_defaults"];
    srcs = [":services.usage-sources"];
    libs = ["services.core"];
};

in { inherit "services.usage" "services.usage-sources"; }
