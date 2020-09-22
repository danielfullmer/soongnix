{ filegroup, java_library_static }:
let

"services.systemcaptions-sources" = filegroup {
    name = "services.systemcaptions-sources";
    srcs = [
        "java/com/android/server/systemcaptions/RemoteSystemCaptionsManagerService.java"
        "java/com/android/server/systemcaptions/SystemCaptionsManagerPerUserService.java"
        "java/com/android/server/systemcaptions/SystemCaptionsManagerService.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.systemcaptions" = java_library_static {
    name = "services.systemcaptions";
    defaults = ["services_defaults"];
    srcs = [":services.systemcaptions-sources"];
    libs = ["services.core"];
};

in { inherit "services.systemcaptions" "services.systemcaptions-sources"; }
