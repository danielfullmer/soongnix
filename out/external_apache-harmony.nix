{ java_test }:
let

apache-harmony-tests = java_test {
    name = "apache-harmony-tests";
    hostdex = true;
    srcs = [
        "beans/src/test/java/**/*.java"
        "logging/src/test/java/**/*.java"
        "luni/src/test/java/**/*.java"
        "sql/src/test/java/**/*.java"
        "support/src/test/java/**/*.java"

        "beans/src/test/support/java/**/*.java"
        "logging/src/test/support/java/**/*.java"
        "luni/src/test/support/java/**/*.java"
        "sql/src/test/support/java/**/*.java"
        "support/src/test/support/java/**/*.java"

        "luni/src/test/api/common/**/*.java"
        "luni/src/test/api/unix/**/*.java"
        "luni/src/test/impl/common/**/*.java"
        "luni/src/test/impl/unix/**/*.java"
    ];
    java_resource_dirs = [
        "beans/src/test/resources"
        "logging/src/test/resources"
        "sql/src/test/resources"
        "support/src/test/resources"
    ];
    no_standard_libs = true;
    libs = [
        "core-all"
        "junit"
    ];
    system_modules = "core-all-system-modules";
    javacflags = ["-Xmaxwarns 9999999"];
    jarjar_rules = "jarjar-rules.txt";
    #  Pin java_version until jarjar is certified to support later versions. http://b/72703434
    java_version = "1.8";

    #  b/73499927
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };
};

in { inherit apache-harmony-tests; }
