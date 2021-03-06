{ java_import }:
let

kotlin-annotations = java_import {
    name = "kotlin-annotations";
    host_supported = true;
    jars = ["lib/annotations-13.0.jar"];
    sdk_version = "core_current";
};

kotlin-reflect = java_import {
    name = "kotlin-reflect";
    host_supported = true;
    jars = ["lib/kotlin-reflect.jar"];
    sdk_version = "core_current";
};

kotlin-stdlib = java_import {
    name = "kotlin-stdlib";
    host_supported = true;
    jars = ["lib/kotlin-stdlib.jar"];
    sdk_version = "core_current";
};

kotlin-test = java_import {
    name = "kotlin-test";
    host_supported = true;
    jars = [
        "lib/kotlin-test.jar"
        "lib/kotlin-test-junit.jar"
    ];
    sdk_version = "core_current";
};

in { inherit kotlin-annotations kotlin-reflect kotlin-stdlib kotlin-test; }
