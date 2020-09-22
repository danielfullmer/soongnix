{ android_test, filegroup }:
let

LocationAccessingApp = android_test {
    name = "LocationAccessingApp";
    defaults = ["cts_defaults"];
    srcs = [
        ":location_accessing_app_srcs"
    ];
    aidl = {
        local_include_dirs = ["aidl/"];
    };
    sdk_version = "test_current";
    test_suites = [
        "cts"
        "vts10"
        "mts"
    ];
};

location_accessing_app_srcs = filegroup {
    name = "location_accessing_app_srcs";
    srcs = [
        "src/android/telephony/cts/locationaccessingapp/CtsLocationAccessService.java"
        "aidl/android/telephony/cts/locationaccessingapp/ICtsLocationAccessControl.aidl"
    ];
};

in { inherit LocationAccessingApp location_accessing_app_srcs; }
