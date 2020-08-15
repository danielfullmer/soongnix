{ android_test }:
let

LocationTracker = android_test {
    name = "LocationTracker";
    srcs = [
        "src/com/android/locationtracker/SettingsActivity.java"
        "src/com/android/locationtracker/TrackerActivity.java"
        "src/com/android/locationtracker/TrackerService.java"
        "src/com/android/locationtracker/data/CSVFormatter.java"
        "src/com/android/locationtracker/data/DateUtils.java"
        "src/com/android/locationtracker/data/IFormatter.java"
        "src/com/android/locationtracker/data/KMLFormatter.java"
        "src/com/android/locationtracker/data/TrackerDataHelper.java"
        "src/com/android/locationtracker/data/TrackerEntry.java"
        "src/com/android/locationtracker/data/TrackerListHelper.java"
        "src/com/android/locationtracker/data/TrackerProvider.java"
    ];
    sdk_version = "current";
};

in { inherit LocationTracker; }
