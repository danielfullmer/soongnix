{ java_library_static }:
let

"services.people" = java_library_static {
    name = "services.people";
    defaults = ["services_defaults"];
    srcs = [
        "java/com/android/server/people/PeopleService.java"
        "java/com/android/server/people/SessionInfo.java"
        "java/com/android/server/people/data/AbstractProtoDiskReadWriter.java"
        "java/com/android/server/people/data/AggregateEventHistoryImpl.java"
        "java/com/android/server/people/data/AppUsageStatsData.java"
        "java/com/android/server/people/data/CallLogQueryHelper.java"
        "java/com/android/server/people/data/ContactsQueryHelper.java"
        "java/com/android/server/people/data/ConversationInfo.java"
        "java/com/android/server/people/data/ConversationStore.java"
        "java/com/android/server/people/data/DataMaintenanceService.java"
        "java/com/android/server/people/data/DataManager.java"
        "java/com/android/server/people/data/Event.java"
        "java/com/android/server/people/data/EventHistory.java"
        "java/com/android/server/people/data/EventHistoryImpl.java"
        "java/com/android/server/people/data/EventIndex.java"
        "java/com/android/server/people/data/EventList.java"
        "java/com/android/server/people/data/EventStore.java"
        "java/com/android/server/people/data/MmsQueryHelper.java"
        "java/com/android/server/people/data/PackageData.java"
        "java/com/android/server/people/data/SmsQueryHelper.java"
        "java/com/android/server/people/data/UsageStatsQueryHelper.java"
        "java/com/android/server/people/data/UserData.java"
        "java/com/android/server/people/data/Utils.java"
        "java/com/android/server/people/prediction/AppTargetPredictor.java"
        "java/com/android/server/people/prediction/ConversationData.java"
        "java/com/android/server/people/prediction/ShareTargetPredictor.java"
        "java/com/android/server/people/prediction/SharesheetModelScorer.java"
    ];
    libs = ["services.core"];
};

in { inherit "services.people"; }
