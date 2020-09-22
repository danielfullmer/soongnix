{ android_app, filegroup, genrule, java_defaults }:
let

#  Copyright 2019 The Android Open Source Project
CellBroadcastServiceCommon = java_defaults {
    name = "CellBroadcastServiceCommon";
    min_sdk_version = "29";
    srcs = [
        "src/com/android/cellbroadcastservice/BearerData.java"
        "src/com/android/cellbroadcastservice/BitwiseInputStream.java"
        "src/com/android/cellbroadcastservice/CbGeoUtils.java"
        "src/com/android/cellbroadcastservice/CdmaServiceCategoryProgramHandler.java"
        "src/com/android/cellbroadcastservice/CellBroadcastHandler.java"
        "src/com/android/cellbroadcastservice/CellBroadcastProvider.java"
        "src/com/android/cellbroadcastservice/DefaultCellBroadcastService.java"
        "src/com/android/cellbroadcastservice/GsmAlphabet.java"
        "src/com/android/cellbroadcastservice/GsmCellBroadcastHandler.java"
        "src/com/android/cellbroadcastservice/GsmSmsCbMessage.java"
        "src/com/android/cellbroadcastservice/SmsCbConstants.java"
        "src/com/android/cellbroadcastservice/SmsCbHeader.java"
        "src/com/android/cellbroadcastservice/SmsHeader.java"
        "src/com/android/cellbroadcastservice/UserData.java"
        "src/com/android/cellbroadcastservice/WakeLockStateMachine.java"
        ":framework-annotations"
        ":framework-cellbroadcast-shared-srcs"
        ":statslog-cellbroadcast-java-gen"
    ];
    libs = [
        "unsupportedappusage"
    ];
    sdk_version = "system_current";
    certificate = "platform";
    privileged = true;
    resource_dirs = ["res"];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    jarjar_rules = "cellbroadcast-jarjar-rules.txt";
    plugins = ["java_api_finder"];
};

CellBroadcastServiceModule = android_app {
    name = "CellBroadcastServiceModule";
    defaults = ["CellBroadcastServiceCommon"];
    certificate = "networkstack";
    manifest = "AndroidManifest.xml";
    apex_available = ["com.android.cellbroadcast"];
};

CellBroadcastServiceModulePlatform = android_app {
    name = "CellBroadcastServiceModulePlatform";
    defaults = ["CellBroadcastServiceCommon"];
    certificate = "platform";
    #  CellBroadcastServicePlatformModule is a replacement for com.android.cellbroadcast apex
    #  which consists of CellBroadcastServiceModule
    overrides = ["com.android.cellbroadcast"];
    manifest = "AndroidManifest_Platform.xml";
};

statslog-cellbroadcast-java-gen = genrule {
    name = "statslog-cellbroadcast-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module cellbroadcast --javaPackage com.android.cellbroadcastservice --javaClass CellBroadcastStatsLog";
    out = ["com/android/cellbroadcastservice/CellBroadcastStatsLog.java"];
};

#  used to share common constants between cellbroadcastservice and cellbroadcastreceier
cellbroadcast-constants-shared-srcs = filegroup {
    name = "cellbroadcast-constants-shared-srcs";
    srcs = [
        "src/com/android/cellbroadcastservice/SmsCbConstants.java"
        ":statslog-cellbroadcast-java-gen"
    ];
};

#  used to share src with cellbroadcastreceiver test app
cellbroadcast-util-shared-srcs = filegroup {
    name = "cellbroadcast-util-shared-srcs";
    srcs = [
        "src/com/android/cellbroadcastservice/GsmAlphabet.java"
        "src/com/android/cellbroadcastservice/CbGeoUtils.java"
        "src/com/android/cellbroadcastservice/SmsCbHeader.java"
    ];
};

#  used to share src with unit test app
cellbroadcast-shared-srcs = filegroup {
    name = "cellbroadcast-shared-srcs";
    srcs = [
        "src/com/android/cellbroadcastservice/BearerData.java"
        "src/com/android/cellbroadcastservice/BitwiseInputStream.java"
        "src/com/android/cellbroadcastservice/CbGeoUtils.java"
        "src/com/android/cellbroadcastservice/CdmaServiceCategoryProgramHandler.java"
        "src/com/android/cellbroadcastservice/CellBroadcastHandler.java"
        "src/com/android/cellbroadcastservice/CellBroadcastProvider.java"
        "src/com/android/cellbroadcastservice/DefaultCellBroadcastService.java"
        "src/com/android/cellbroadcastservice/GsmAlphabet.java"
        "src/com/android/cellbroadcastservice/GsmCellBroadcastHandler.java"
        "src/com/android/cellbroadcastservice/GsmSmsCbMessage.java"
        "src/com/android/cellbroadcastservice/SmsCbConstants.java"
        "src/com/android/cellbroadcastservice/SmsCbHeader.java"
        "src/com/android/cellbroadcastservice/SmsHeader.java"
        "src/com/android/cellbroadcastservice/UserData.java"
        "src/com/android/cellbroadcastservice/WakeLockStateMachine.java"
        ":framework-cellbroadcast-shared-srcs"
        ":statslog-cellbroadcast-java-gen"
    ];
};

in { inherit CellBroadcastServiceCommon CellBroadcastServiceModule CellBroadcastServiceModulePlatform cellbroadcast-constants-shared-srcs cellbroadcast-shared-srcs cellbroadcast-util-shared-srcs statslog-cellbroadcast-java-gen; }
