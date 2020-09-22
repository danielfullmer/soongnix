{ filegroup, java_library_static }:
let

"services.wifi-sources" = filegroup {
    name = "services.wifi-sources";
    srcs = ["java/com/android/server/wifi/SupplicantManager.java"];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.wifi" = java_library_static {
    name = "services.wifi";
    defaults = ["services_defaults"];
    srcs = [
        ":services.wifi-sources"
    ];
};

in { inherit "services.wifi" "services.wifi-sources"; }
