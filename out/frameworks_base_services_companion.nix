{ filegroup, java_library_static }:
let

"services.companion-sources" = filegroup {
    name = "services.companion-sources";
    srcs = ["java/com/android/server/companion/CompanionDeviceManagerService.java"];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.companion" = java_library_static {
    name = "services.companion";
    defaults = ["services_defaults"];
    srcs = [":services.companion-sources"];
    libs = ["services.core"];
};

in { inherit "services.companion" "services.companion-sources"; }
