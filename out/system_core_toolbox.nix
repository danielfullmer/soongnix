{ cc_binary, cc_defaults, genrule }:
let

toolbox_defaults = cc_defaults {
    name = "toolbox_defaults";

    cflags = [
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-unused-const-variable"
        "-D_FILE_OFFSET_BITS=64"
        "-DWITHOUT_NLS"
        "-DWITHOUT_BZ2"
        "-DWITHOUT_GZIP"
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
    ];
    generated_headers = [
        "toolbox_input_labels"
    ];
    shared_libs = [
        "libbase"
    ];
    static_libs = ["libpropertyinfoparser"];

    symlinks = [
        "getevent"
        "getprop"
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

#  We only want 'r' on userdebug and eng builds.
r = cc_binary {
    name = "r";
    defaults = ["toolbox_defaults"];
    srcs = ["r.c"];
    vendor_available = true;
};

#  We build BSD grep separately (but see http://b/111849261).
grep_common = cc_defaults {
    name = "grep_common";
    defaults = ["toolbox_defaults"];
    srcs = [
        "upstream-netbsd/usr.bin/grep/fastgrep.c"
        "upstream-netbsd/usr.bin/grep/file.c"
        "upstream-netbsd/usr.bin/grep/grep.c"
        "upstream-netbsd/usr.bin/grep/queue.c"
        "upstream-netbsd/usr.bin/grep/util.c"
    ];
    symlinks = [
        "egrep"
        "fgrep"
    ];
    sanitize = {
        integer_overflow = false;
    };
};

grep = cc_binary {
    name = "grep";
    defaults = ["grep_common"];
    recovery_available = true;
};

#  Build vendor grep.
#  TODO: Add vendor_available to "grep" module and remove "grep_vendor" module
#        when vendor_available is fully supported.
grep_vendor = cc_binary {
    name = "grep_vendor";
    stem = "grep";
    vendor = true;
    defaults = ["grep_common"];
};

in { inherit grep grep_common grep_vendor r toolbox toolbox_binary_defaults toolbox_defaults toolbox_input_labels toolbox_vendor; }
