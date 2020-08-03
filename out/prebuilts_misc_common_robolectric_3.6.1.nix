{ java_import }:
let

"platform-robolectric-3.6.1-prebuilt" = java_import {
    name = "platform-robolectric-3.6.1-prebuilt";
    sdk_version = "current";
    jars = [
        "lib/annotations-3.6.1.jar"
        "lib/asm-6.0.jar"
        "lib/junit-3.6.1.jar"
        "lib/resources-3.6.1.jar"
        "lib/sandbox-3.6.1.jar"
        "lib/shadowapi-3.6.1.jar"
        "lib/shadows-framework-3.6.1.jar"
        "lib/shadows-httpclient-3.6.1.jar"
        "lib/shadows-multidex-3.6.1.jar"
        "lib/shadows-supportv4-3.6.1.jar"
        "lib/robolectric-3.6.1.jar"
        "lib/utils-3.6.1.jar"
    ];
};

in { inherit "platform-robolectric-3.6.1-prebuilt"; }
