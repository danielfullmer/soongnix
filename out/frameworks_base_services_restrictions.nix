{ filegroup, java_library_static }:
let

"services.restrictions-sources" = filegroup {
    name = "services.restrictions-sources";
    srcs = ["java/com/android/server/restrictions/RestrictionsManagerService.java"];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.restrictions" = java_library_static {
    name = "services.restrictions";
    defaults = ["services_defaults"];
    srcs = [":services.restrictions-sources"];
    libs = ["services.core"];
};

in { inherit "services.restrictions" "services.restrictions-sources"; }
