{ java_import_host, java_library_host }:
let

jvm-jacoco-reporter = java_library_host {
    name = "jvm-jacoco-reporter";

    srcs = ["src/main/java/com/google/android/jacoco/reporter/ReportGenerator.java"];

    static_libs = [
        "asm-analysis-prebuilt-host-jar"
        "asm-commons-prebuilt-host-jar"
        "asm-prebuilt-host-jar"
        "asm-tree-prebuilt-host-jar"
        "asm-util-prebuilt-host-jar"
        "jvm-jacoco-report"
        "commons-cli-1.2"
    ];
};

jvm-jacoco-agent = java_import_host {
    name = "jvm-jacoco-agent";
    jars = ["lib/jacocoagent.jar"];
};

jvm-jacoco-report = java_import_host {
    name = "jvm-jacoco-report";
    jars = [
        "lib/org.jacoco.core-0.8.0.201801022044.jar"
        "lib/org.jacoco.report-0.8.0.201801022044.jar"
    ];
};

in { inherit jvm-jacoco-agent jvm-jacoco-report jvm-jacoco-reporter; }
