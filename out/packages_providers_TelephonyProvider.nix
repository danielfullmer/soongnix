{ android_app, filegroup }:
let

TelephonyProvider = android_app {
    name = "TelephonyProvider";
    privileged = true;
    srcs = [
        "src/com/android/providers/telephony/CarrierDatabaseHelper.java"
        "src/com/android/providers/telephony/CarrierIdProvider.java"
        "src/com/android/providers/telephony/CarrierProvider.java"
        "src/com/android/providers/telephony/HbpcdLookupDatabaseHelper.java"
        "src/com/android/providers/telephony/HbpcdLookupProvider.java"
        "src/com/android/providers/telephony/MmsProvider.java"
        "src/com/android/providers/telephony/MmsSmsDatabaseHelper.java"
        "src/com/android/providers/telephony/MmsSmsProvider.java"
        "src/com/android/providers/telephony/ProviderUtil.java"
        "src/com/android/providers/telephony/SQLiteTokenizer.java"
        "src/com/android/providers/telephony/SmsChangesProvider.java"
        "src/com/android/providers/telephony/SmsProvider.java"
        "src/com/android/providers/telephony/SqlQueryChecker.java"
        "src/com/android/providers/telephony/TelephonyBackupAgent.java"
        "src/com/android/providers/telephony/TelephonyProvider.java"
        "proto/src/carrierId.proto"
    ];
    asset_dirs = ["assets/latest_carrier_id"];
    platform_apis = true;
    certificate = "platform";
    libs = ["telephony-common"];
    static_libs = [
        "android-common"
        "telephonyprovider-protos"
    ];
};

telephonyprovider-assets-carrierlist = filegroup {
    name = "telephonyprovider-assets-carrierlist";
    srcs = [
        "assets/latest_carrier_id/carrier_list.pb"
        "assets/latest_carrier_id/carrier_list.textpb"
    ];
};

in { inherit TelephonyProvider telephonyprovider-assets-carrierlist; }
