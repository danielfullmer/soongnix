{ android_library_import, java_import, java_import_host, java_plugin }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

tv-auto-common-jar = java_import {
    name = "tv-auto-common-jar";
    jars = ["m2/auto-common-0.10.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-auto-factory-jar = java_import {
    name = "tv-auto-factory-jar";
    jars = ["m2/auto-factory-1.0-beta6.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-auto-factory = java_plugin {
    name = "tv-auto-factory";
    static_libs = [
        "jsr330"
        "tv-auto-common-jar"
        "tv-auto-factory-jar"
        "tv-auto-value-jar"
        "tv-google-java-format-jar"
        "tv-guava-jre-jar"
        "tv-javapoet-jar"
        "tv-javax-annotations-jar"
    ];
    processor_class = "com.google.auto.factory.processor.AutoFactoryProcessor";
    generates_api = true;
};

tv-auto-value-jar = java_import {
    name = "tv-auto-value-jar";
    jars = ["m2/auto-value-1.5.3.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-auto-value = java_plugin {
    name = "tv-auto-value";
    static_libs = [
        "tv-auto-value-jar"
        "tv-guava-jre-jar"
    ];
    processor_class = "com.google.auto.value.processor.AutoValueProcessor";
};

tv-error-prone-annotations-jar = java_import {
    name = "tv-error-prone-annotations-jar";
    jars = ["m2/error_prone_annotations-2.3.2.jar"];
    sdk_version = "current";
};

tv-google-java-format-jar = java_import {
    name = "tv-google-java-format-jar";
    jars = ["google-java-format-1.7-all-deps.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-guava-android-jar = java_import {
    name = "tv-guava-android-jar";
    jars = ["m2/guava-28.0-android.jar"];
    sdk_version = "current";
};

tv-guava-jre-jar = java_import {
    name = "tv-guava-jre-jar";
    jars = ["m2/guava-28.0-jre.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-guava-failureaccess-jar = java_import {
    name = "tv-guava-failureaccess-jar";
    jars = ["m2/failureaccess-1.0.1.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-javapoet-jar = java_import_host {
    name = "tv-javapoet-jar";
    jars = ["m2/javapoet-1.11.1.jar"];
};

tv-javax-annotations-jar = java_import {
    name = "tv-javax-annotations-jar";
    jars = ["javax.annotation-api-1.2.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-lib-exoplayer = android_library_import {
    name = "tv-lib-exoplayer";
    aars = ["exoplayer-r1.5.16.aar"];
    sdk_version = "current";
};

tv-lib-exoplayer-v2-core = android_library_import {
    name = "tv-lib-exoplayer-v2-core";
    aars = ["exoplayer-core-2.10.1.aar"];
    sdk_version = "current";
};

tv-lib-exoplayer-v2-ui = android_library_import {
    name = "tv-lib-exoplayer-v2-ui";
    aars = ["exoplayer-ui-2.10.1.aar"];
    sdk_version = "current";
};

tv-lib-dagger-compiler-import = java_import_host {
    name = "tv-lib-dagger-compiler-import";
    jars = [
        "m2/dagger-compiler-2.23.jar"
        "m2/dagger-producers-2.23.jar"
        "m2/dagger-spi-2.23.jar"
    ];
};

tv-lib-dagger = java_import {
    name = "tv-lib-dagger";
    jars = ["m2/dagger-2.23.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-lib-dagger-compiler = java_plugin {
    name = "tv-lib-dagger-compiler";
    static_libs = [
        "tv-lib-dagger-compiler-import"
        "tv-guava-jre-jar"
        "tv-javapoet-jar"
        "jsr330"
        "tv-lib-dagger"
    ];
    processor_class = "dagger.internal.codegen.ComponentProcessor";
    generates_api = true;
    #  shade guava to avoid conflicts with guava embedded in Error Prone.
    jarjar_rules = "m2/dagger-jarjar-rules.txt";
};

tv-lib-dagger-android = android_library_import {
    name = "tv-lib-dagger-android";
    aars = ["m2/dagger-android-2.23.aar"];
    sdk_version = "current";
};

tv-lib-dagger-android-processor-import = java_import_host {
    name = "tv-lib-dagger-android-processor-import";
    jars = [
        "m2/dagger-android-jarimpl-2.23.jar"
        "m2/dagger-android-processor-2.23.jar"
        "m2/dagger-spi-2.23.jar"
        "m2/protobuf-java-3.7.0.jar"
    ];
};

tv-lib-dagger-android-processor = java_plugin {
    name = "tv-lib-dagger-android-processor";
    static_libs = [
        "tv-lib-dagger-android-processor-import"
        "tv-guava-jre-jar"
        "tv-guava-failureaccess-jar"
        "tv-javapoet-jar"
        "tv-google-java-format-jar"
        "jsr330"
        "tv-lib-dagger"
    ];
    processor_class = "dagger.android.processor.AndroidProcessor";
    generates_api = true;
    #  shade guava to avoid conflicts with guava embedded in Error Prone.
    jarjar_rules = "m2/dagger-jarjar-rules.txt";
};

tv-lib-truth = java_import {
    name = "tv-lib-truth";
    jars = ["truth-0.45.jar"];
    host_supported = true;
    sdk_version = "current";
};

in { inherit tv-auto-common-jar tv-auto-factory tv-auto-factory-jar tv-auto-value tv-auto-value-jar tv-error-prone-annotations-jar tv-google-java-format-jar tv-guava-android-jar tv-guava-failureaccess-jar tv-guava-jre-jar tv-javapoet-jar tv-javax-annotations-jar tv-lib-dagger tv-lib-dagger-android tv-lib-dagger-android-processor tv-lib-dagger-android-processor-import tv-lib-dagger-compiler tv-lib-dagger-compiler-import tv-lib-exoplayer tv-lib-exoplayer-v2-core tv-lib-exoplayer-v2-ui tv-lib-truth; }
