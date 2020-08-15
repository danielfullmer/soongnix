{ java_library_static }:
let

"services.contentsuggestions" = java_library_static {
    name = "services.contentsuggestions";
    srcs = [
        "java/com/android/server/contentsuggestions/ContentSuggestionsManagerService.java"
        "java/com/android/server/contentsuggestions/ContentSuggestionsManagerServiceShellCommand.java"
        "java/com/android/server/contentsuggestions/ContentSuggestionsPerUserService.java"
        "java/com/android/server/contentsuggestions/RemoteContentSuggestionsService.java"
    ];
    libs = ["services.core"];
};

in { inherit "services.contentsuggestions"; }
