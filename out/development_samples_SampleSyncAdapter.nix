{ android_test }:
let

SampleSyncAdapter = android_test {
    name = "SampleSyncAdapter";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/samplesync/Constants.java"
        "src/com/example/android/samplesync/activities/InviteContactActivity.java"
        "src/com/example/android/samplesync/activities/ViewGroupActivity.java"
        "src/com/example/android/samplesync/authenticator/AuthenticationService.java"
        "src/com/example/android/samplesync/authenticator/Authenticator.java"
        "src/com/example/android/samplesync/authenticator/AuthenticatorActivity.java"
        "src/com/example/android/samplesync/client/NetworkUtilities.java"
        "src/com/example/android/samplesync/client/RawContact.java"
        "src/com/example/android/samplesync/notifier/NotifierService.java"
        "src/com/example/android/samplesync/platform/BatchOperation.java"
        "src/com/example/android/samplesync/platform/ContactManager.java"
        "src/com/example/android/samplesync/platform/ContactOperations.java"
        "src/com/example/android/samplesync/platform/SampleSyncAdapterColumns.java"
        "src/com/example/android/samplesync/syncadapter/SyncAdapter.java"
        "src/com/example/android/samplesync/syncadapter/SyncService.java"
    ];
    sdk_version = "15";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit SampleSyncAdapter; }
