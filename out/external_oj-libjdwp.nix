{ cc_defaults, cc_library, cc_library_headers, genrule, java_binary_host, java_library_host, python_binary_host }:
let

jdwpgen = java_binary_host {
    name = "jdwpgen";
    srcs = ["make/src/classes/build/tools/jdwpgen/*.java"];
    wrapper = "etc/jdwpgen.sh";
    manifest = "etc/manifest.txt";
    java_version = "1.8";
};

jdwp_generated_headers = genrule {
    name = "jdwp_generated_headers";
    tools = ["jdwpgen"];
    cmd = "$(location jdwpgen) $(in) -include $(out)";
    srcs = ["make/data/jdwp/jdwp.spec"];
    out = ["JDWPCommands.h"];
};

upstream-jdwp-defaults = cc_defaults {
    name = "upstream-jdwp-defaults";
    host_supported = true;
    device_supported = true;
    cflags = [
        #  Every supported android platform is little-endian.
        "-D_LITTLE_ENDIAN"
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    notice = "LICENSE";
    target = {
        darwin = {
            enabled = false;
        };
    };
};

javavm_headers = cc_library_headers {
    name = "javavm_headers";
    export_include_dirs = [
        "src/share/javavm/export"
        "src/solaris/javavm/export"
    ];
    host_supported = true;
    device_supported = true;
};

libnpt_headers = cc_library_headers {
    name = "libnpt_headers";
    export_include_dirs = [
        "src/share/npt"
        "src/solaris/npt"
    ];
    defaults = ["upstream-jdwp-defaults"];
};

libnpt = cc_library {
    name = "libnpt";
    srcs = [
        "src/share/npt/*.c"
        "src/solaris/npt/*.c"
    ];
    header_libs = [
        "javavm_headers"
        "libnpt_headers"
    ];
    defaults = ["upstream-jdwp-defaults"];
};

libjdwp_headers = cc_library_headers {
    name = "libjdwp_headers";
    export_include_dirs = [
        "src/share/back"
        "src/share/back/export"
        "src/solaris/back"
    ];
    generated_headers = ["jdwp_generated_headers"];
    export_generated_headers = ["jdwp_generated_headers"];
    defaults = ["upstream-jdwp-defaults"];
};

libjdwp = cc_library {
    name = "libjdwp";
    srcs = [
        "src/share/back/*.c"
        "src/solaris/back/*.c"
    ];
    cflags = [
        "-DLINUX"
        "-DJDWP_LOGGING"
        "-Wno-switch"
        "-Wno-logical-op-parentheses"
        "-Wno-logical-not-parentheses"
        "-Wno-sometimes-uninitialized"
        "-Wno-self-assign"
        "-Wno-unused-variable"
        "-Wno-unused-function"
    ];
    header_libs = [
        "javavm_headers"
        "libjdwp_headers"
        "libnpt_headers"
    ];
    required = [
        "libnpt"
        "libdt_socket"
    ];
    defaults = ["upstream-jdwp-defaults"];
};

libdt_socket = cc_library {
    name = "libdt_socket";
    srcs = [
        "src/share/transport/socket/*.c"
        "src/solaris/transport/socket/*.c"
    ];
    local_include_dirs = [
        "src/share/transport/socket"
        "src/solaris/transport/socket"
    ];
    header_libs = [
        "javavm_headers"
        "libjdwp_headers"
        "libnpt_headers"
    ];
    required = ["libnpt"];
    defaults = ["upstream-jdwp-defaults"];
};

jdwp_generated_java = genrule {
    name = "jdwp_generated_java";
    tools = ["jdwpgen"];
    cmd = "$(location jdwpgen) $(in) -jdi $(out)";
    srcs = ["make/data/jdwp/jdwp.spec"];
    out = ["JDWP.java"];
};

jdi_prop_gen = python_binary_host {
    name = "jdi_prop_gen";
    srcs = ["etc/jdigen.py"];
    main = "etc/jdigen.py";
};

jdi_generated_properties = genrule {
    name = "jdi_generated_properties";
    tools = ["jdi_prop_gen"];
    cmd = "$(location jdi_prop_gen) $(in) $(out)";
    out = ["jdi.java"];
    srcs = ["src/share/classes/com/sun/tools/jdi/resources/jdi.properties"];
};

#  The classes needed to support JDI and debug remote processes.
jdi-support = java_library_host {
    name = "jdi-support";
    srcs = [
        #  The JDI interface definition.
        "src/share/classes/com/sun/jdi/**/*.java"
        #  The JDI interface implementation
        "src/share/classes/com/sun/tools/jdi/**/*.java"
        #  The JDWP.java file that contains all the constants.
        ":jdwp_generated_java"
        #  The properties class which holds information about the various connectors.
        ":jdi_generated_properties"
    ];
    exclude_srcs = [
        #  We don't support process attachment and lack some of the classes to even compile this file.
        "src/share/classes/com/sun/tools/jdi/ProcessAttachingConnector.java"
    ];
    services = ["etc/com.sun.jdi.connect.Connector"];
    javacflags = ["-g"];
    notice = "LICENSE";
};

in { inherit javavm_headers jdi-support jdi_generated_properties jdi_prop_gen jdwp_generated_headers jdwp_generated_java jdwpgen libdt_socket libjdwp libjdwp_headers libnpt libnpt_headers upstream-jdwp-defaults; }
