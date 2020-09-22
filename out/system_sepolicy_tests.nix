{ cc_library_host_shared, python_binary_host, python_defaults }:
let

libsepolwrap = cc_library_host_shared {
    name = "libsepolwrap";
    srcs = ["sepol_wrap.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = ["include"];

    #  libsepolwrap gets loaded from the system python, which does not have the
    #  ASAN runtime. So turn off sanitization for ourself, and  use static
    #  libraries, since the shared libraries will use ASAN.
    static_libs = [
        "libbase"
        "libsepol"
    ];
    sanitize = {
        never = true;
    };
};

py2_only = python_defaults {
    name = "py2_only";
    version = {
        py2 = {
            embedded_launcher = true;
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

treble_sepolicy_tests = python_binary_host {
    name = "treble_sepolicy_tests";
    srcs = [
        "fc_sort.py"
        "mini_parser.py"
        "policy.py"
        "treble_sepolicy_tests.py"
    ];
    required = ["libsepolwrap"];
    defaults = ["py2_only"];
};

sepolicy_tests = python_binary_host {
    name = "sepolicy_tests";
    srcs = [
        "fc_sort.py"
        "policy.py"
        "sepolicy_tests.py"
    ];
    required = ["libsepolwrap"];
    defaults = ["py2_only"];
};

searchpolicy = python_binary_host {
    name = "searchpolicy";
    srcs = [
        "fc_sort.py"
        "policy.py"
        "searchpolicy.py"
    ];
    required = ["libsepolwrap"];
    defaults = ["py2_only"];
};

combine_maps = python_binary_host {
    name = "combine_maps";
    srcs = [
        "combine_maps.py"
        "mini_parser.py"
    ];
    defaults = ["py2_only"];
};

fc_sort = python_binary_host {
    name = "fc_sort";
    srcs = [
        "fc_sort.py"
    ];
    defaults = ["py2_only"];
};

in { inherit combine_maps fc_sort libsepolwrap py2_only searchpolicy sepolicy_tests treble_sepolicy_tests; }
