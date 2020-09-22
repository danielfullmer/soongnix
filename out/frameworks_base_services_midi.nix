{ filegroup, java_library_static }:
let

"services.midi-sources" = filegroup {
    name = "services.midi-sources";
    srcs = ["java/com/android/server/midi/MidiService.java"];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.midi" = java_library_static {
    name = "services.midi";
    defaults = ["services_defaults"];
    srcs = [":services.midi-sources"];
    libs = ["services.core"];
};

in { inherit "services.midi" "services.midi-sources"; }
