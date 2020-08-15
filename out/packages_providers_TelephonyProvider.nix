{ android_app }:
let

TelephonyProvider = android_app {
    name = "TelephonyProvider";
    privileged = true;
    srcs = [
        "src/com/android/providers/telephony/CarrierDatabaseHelper.java"
        "src/com/android/providers/telephony/CarrierIdProvider.java"
        "src/com/android/providers/telephony/CarrierProvider.java"
        "src/com/android/providers/telephony/CellBroadcastProvider.java"
        "src/com/android/providers/telephony/HbpcdLookupDatabaseHelper.java"
        "src/com/android/providers/telephony/HbpcdLookupProvider.java"
        "src/com/android/providers/telephony/MmsProvider.java"
        "src/com/android/providers/telephony/MmsSmsDatabaseHelper.java"
        "src/com/android/providers/telephony/MmsSmsProvider.java"
        "src/com/android/providers/telephony/ProviderUtil.java"
        "src/com/android/providers/telephony/RcsProvider.java"
        "src/com/android/providers/telephony/RcsProviderCanonicalAddressHelper.java"
        "src/com/android/providers/telephony/RcsProviderEventHelper.java"
        "src/com/android/providers/telephony/RcsProviderMessageHelper.java"
        "src/com/android/providers/telephony/RcsProviderParticipantHelper.java"
        "src/com/android/providers/telephony/RcsProviderThreadHelper.java"
        "src/com/android/providers/telephony/RcsProviderUtil.java"
        "src/com/android/providers/telephony/SQLiteTokenizer.java"
        "src/com/android/providers/telephony/ServiceStateProvider.java"
        "src/com/android/providers/telephony/SmsChangesProvider.java"
        "src/com/android/providers/telephony/SmsProvider.java"
        "src/com/android/providers/telephony/SqlQueryChecker.java"
        "src/com/android/providers/telephony/SqlTokenFinder.java"
        "src/com/android/providers/telephony/TelephonyBackupAgent.java"
        "src/com/android/providers/telephony/TelephonyProvider.java"
    ];
    platform_apis = true;
    certificate = "platform";
    libs = ["telephony-common"];
    static_libs = ["android-common"];
};

in { inherit TelephonyProvider; }
