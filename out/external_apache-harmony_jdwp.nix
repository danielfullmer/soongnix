{ java_genrule, java_library_host, java_test }:
let

SourceDebugExtensionMockClass_gen = java_genrule {
    name = "SourceDebugExtensionMockClass_gen";
    host_supported = true;
    srcs = ["src/test/resources/org/apache/harmony/jpda/tests/jdwp/Events/SourceDebugExtensionMockClass.class"];
    tools = ["soong_zip"];
    cmd = "$(location soong_zip) -jar -o $(out) -C external/apache-harmony/jdwp/src/test/resources -f $(in)";
    out = ["SourceDebugExtensionMockClass_gen.jar"];
};

apache-harmony-jdwp-tests = java_test {
    name = "apache-harmony-jdwp-tests";
    hostdex = true;
    host_supported = true;
    srcs = ["src/test/java/**/*.java"];
    static_libs = ["SourceDebugExtensionMockClass_gen"];

    libs = ["junit"];

    no_standard_libs = true;
    system_modules = "core-all-system-modules";
    target = {
        #  Only depend on core-all for the Android variant so we can avoid
        #  needing to create a core-all host variant.
        android = {
            libs = ["core-all"];
        };
        host = {
            exclude_srcs = ["src/test/java/org/apache/harmony/jpda/tests/jdwp/DDM/**/*.java"];
        };
    };

    #  b/73499927
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };

    jarjar_rules = "jarjar-rules.txt";
};

apache-harmony-jdwp-tests-host = java_library_host {
    name = "apache-harmony-jdwp-tests-host";
    static_libs = ["apache-harmony-jdwp-tests"];
};

in { inherit SourceDebugExtensionMockClass_gen apache-harmony-jdwp-tests apache-harmony-jdwp-tests-host; }
