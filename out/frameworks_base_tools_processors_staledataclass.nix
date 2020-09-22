{ java_plugin }:
let

staledataclass-annotation-processor = java_plugin {
    name = "staledataclass-annotation-processor";
    processor_class = "android.processor.staledataclass.StaleDataclassProcessor";

    java_resources = [
        "META-INF/**/*"
    ];
    srcs = [

        "src/android/processor/staledataclass/StaleDataclassProcessor.kt"
    ];
    static_libs = [
        "codegen-version-info"
    ];
    #  The --add-modules/exports flags below don't work for kotlinc yet, so pin this module to Java language level 8 (see b/139342589):
    java_version = "1.8";
    openjdk9 = {
        javacflags = [
            "--add-modules=jdk.compiler"
            "--add-exports jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED"
            "--add-exports jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED"
            "--add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED"
            "--add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED"
        ];
    };

    use_tools_jar = true;
};

in { inherit staledataclass-annotation-processor; }
