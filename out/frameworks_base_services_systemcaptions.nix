{ java_library_static }:
let

"services.systemcaptions" = java_library_static {
    name = "services.systemcaptions";
    srcs = [
        "java/com/android/server/systemcaptions/RemoteSystemCaptionsManagerService.java"
        "java/com/android/server/systemcaptions/SystemCaptionsManagerPerUserService.java"
        "java/com/android/server/systemcaptions/SystemCaptionsManagerService.java"
    ];
    libs = ["services.core"];
};

in { inherit "services.systemcaptions"; }
