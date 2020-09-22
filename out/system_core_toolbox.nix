{ cc_binary, cc_defaults, genrule }:
let

toolbox_defaults = cc_defaults {
    name = "toolbox_defaults";
    cflags = [
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-unused-const-variable"
        "-D_FILE_OFFSET_BITS=64"
    ];
};

toolbox_input_labels = genrule {
    name = "toolbox_input_labels";
    tool_files = ["generate-input.h-labels.py"];
    cmd = "$(location) $(in) >$(out)";
    srcs = [":kernel_input_headers"];
    out = ["input.h-labels.h"];
};

toolbox_binary_defaults = cc_defaults {
    name = "toolbox_binary_defaults";
    defaults = ["toolbox_defaults"];
    cpp_std = "experimental";
    srcs = [
        "toolbox.c"
        "getevent.c"
        "getprop.cpp"
        "modprobe.cpp"
        "setprop.cpp"
        "start.cpp"
    ];
    generated_headers = [
        "toolbox_input_labels"
    ];
    shared_libs = [
        "libbase"
    ];
    static_libs = [
        "libmodprobe"
        "libpropertyinfoparser"
    ];

    symlinks = [
        "getevent"
        "getprop"
        "modprobe"
        "setprop"
        "start"
        "stop"
    ];
};

toolbox = cc_binary {
    name = "toolbox";
    defaults = ["toolbox_binary_defaults"];
    recovery_available = true;
};

toolbox_vendor = cc_binary {
    name = "toolbox_vendor";
    stem = "toolbox";
    vendor = true;
    defaults = ["toolbox_binary_defaults"];
};

in { inherit toolbox toolbox_binary_defaults toolbox_defaults toolbox_input_labels toolbox_vendor; }
