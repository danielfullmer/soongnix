{ java_library_static }:
let

"services.restrictions" = java_library_static {
    name = "services.restrictions";
    srcs = ["java/com/android/server/restrictions/RestrictionsManagerService.java"];
    libs = ["services.core"];
};

in { inherit "services.restrictions"; }
