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

in { inherit "IDropBoxManagerService.aidl" "IKeyAttestationApplicationIdProvider.aidl"; }
