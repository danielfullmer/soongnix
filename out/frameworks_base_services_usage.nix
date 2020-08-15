{ java_library_static }:
let

"services.usage" = java_library_static {
    name = "services.usage";
    srcs = [
        "java/com/android/server/usage/AppIdleHistory.java"
        "java/com/android/server/usage/AppStandbyController.java"
        "java/com/android/server/usage/AppTimeLimitController.java"
        "java/com/android/server/usage/IntervalStats.java"
        "java/com/android/server/usage/StorageStatsService.java"
        "java/com/android/server/usage/UnixCalendar.java"
        "java/com/android/server/usage/UsageStatsDatabase.java"
        "java/com/android/server/usage/UsageStatsProto.java"
        "java/com/android/server/usage/UsageStatsService.java"
        "java/com/android/server/usage/UsageStatsXml.java"
        "java/com/android/server/usage/UsageStatsXmlV1.java"
        "java/com/android/server/usage/UserUsageStatsService.java"
    ];
    libs = ["services.core"];
};

in { inherit "services.usage"; }
