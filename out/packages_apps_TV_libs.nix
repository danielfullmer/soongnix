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

tv-auto-factory-jar = java_import {
    name = "tv-auto-factory-jar";
    jars = ["auto-factory-1.0-beta2.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-auto-factory = java_plugin {
    name = "tv-auto-factory";
    static_libs = [
        "jsr330"
        "tv-auto-factory-jar"
        "tv-guava-jre-jar"
        "tv-javawriter-jar"
        "tv-javax-annotations-jar"
    ];
    processor_class = "com.google.auto.factory.processor.AutoFactoryProcessor";
    generates_api = true;
};

tv-auto-value-jar = java_import {
    name = "tv-auto-value-jar";
    jars = ["auto-value-1.5.2.jar"];
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
    jars = ["error_prone_annotations-2.3.1.jar"];
    sdk_version = "current";
};

tv-guava-jre-jar = java_import {
    name = "tv-guava-jre-jar";
    jars = ["guava-23.3-jre.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-guava-android-jar = java_import {
    name = "tv-guava-android-jar";
    jars = ["guava-23.6-android.jar"];
    sdk_version = "current";
};

tv-javawriter-jar = java_import_host {
    name = "tv-javawriter-jar";
    jars = ["javawriter-2.5.1.jar"];
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
    aars = ["exoplayer-core-2.9.0.aar"];
    sdk_version = "current";
};

tv-lib-dagger-compiler-deps = java_import_host {
    name = "tv-lib-dagger-compiler-deps";
    jars = [
        "google-java-format-1.4-all-deps.jar"
        "guava-23.3-jre.jar"
        "javapoet-1.8.0.jar"
    ];
};

tv-lib-dagger-compiler-import = java_import_host {
    name = "tv-lib-dagger-compiler-import";
    jars = [
        "dagger-compiler-2.15.jar"
        "dagger-producers-2.15.jar"
        "dagger-spi-2.15.jar"
    ];
};

tv-lib-dagger = java_import {
    name = "tv-lib-dagger";
    jars = ["dagger-2.15.jar"];
    host_supported = true;
    sdk_version = "current";
};

tv-lib-dagger-compiler = java_plugin {
    name = "tv-lib-dagger-compiler";
    static_libs = [
        "tv-lib-dagger-compiler-import"
        "tv-lib-dagger-compiler-deps"
        "jsr330"
        "tv-lib-dagger"
    ];
    processor_class = "dagger.internal.codegen.ComponentProcessor";
    generates_api = true;
};

tv-lib-dagger-android = android_library_import {
    name = "tv-lib-dagger-android";
    aars = ["dagger-android-2.15.aar"];
    sdk_version = "current";
};

tv-lib-dagger-android-processor-import = java_import_host {
    name = "tv-lib-dagger-android-processor-import";
    jars = [
        "dagger-android-jarimpl-2.15.jar"
        "dagger-android-processor-2.15.jar"
        "dagger-android-support-jarimpl-2.15.jar"
    ];
};

tv-lib-dagger-android-processor = java_plugin {
    name = "tv-lib-dagger-android-processor";
    static_libs = [
        "tv-lib-dagger-android-processor-import"
        "tv-lib-dagger-compiler-deps"
        "jsr330"
        "tv-lib-dagger"
    ];
    processor_class = "dagger.android.processor.AndroidProcessor";
    generates_api = true;
};

tv-lib-truth = java_import {
    name = "tv-lib-truth";
    jars = ["truth-0.36.jar"];
    host_supported = true;
    sdk_version = "current";
};

in { inherit tv-auto-factory tv-auto-factory-jar tv-auto-value tv-auto-value-jar tv-error-prone-annotations-jar tv-guava-android-jar tv-guava-jre-jar tv-javawriter-jar tv-javax-annotations-jar tv-lib-dagger tv-lib-dagger-android tv-lib-dagger-android-processor tv-lib-dagger-android-processor-import tv-lib-dagger-compiler tv-lib-dagger-compiler-deps tv-lib-dagger-compiler-import tv-lib-exoplayer tv-lib-exoplayer-v2-core tv-lib-truth; }
