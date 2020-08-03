{ filegroup }:
let

"IKeyAttestationApplicationIdProvider.aidl" = filegroup {
    name = "IKeyAttestationApplicationIdProvider.aidl";
    srcs = ["android/security/keymaster/IKeyAttestationApplicationIdProvider.aidl"];
};

"IDropBoxManagerService.aidl" = filegroup {
    name = "IDropBoxManagerService.aidl";
    srcs = ["com/android/internal/os/IDropBoxManagerService.aidl"];
};

"ICarStatsService.aidl" = filegroup {
    name = "ICarStatsService.aidl";
    srcs = ["com/android/internal/car/ICarStatsService.aidl"];
};

in { inherit "ICarStatsService.aidl" "IDropBoxManagerService.aidl" "IKeyAttestationApplicationIdProvider.aidl"; }
