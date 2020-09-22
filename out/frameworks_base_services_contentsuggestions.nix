{ filegroup, java_library_static }:
let

"services.contentsuggestions-sources" = filegroup {
    name = "services.contentsuggestions-sources";
    srcs = [
        "java/com/android/server/contentsuggestions/ContentSuggestionsManagerService.java"
        "java/com/android/server/contentsuggestions/ContentSuggestionsManagerServiceShellCommand.java"
        "java/com/android/server/contentsuggestions/ContentSuggestionsPerUserService.java"
        "java/com/android/server/contentsuggestions/RemoteContentSuggestionsService.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.contentsuggestions" = java_library_static {
    name = "services.contentsuggestions";
    defaults = ["services_defaults"];
    srcs = [":services.contentsuggestions-sources"];
    libs = ["services.core"];
};

in { inherit "services.contentsuggestions" "services.contentsuggestions-sources"; }
