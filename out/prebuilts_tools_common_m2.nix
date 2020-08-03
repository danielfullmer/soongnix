{ java_import, java_import_host, java_library_host, java_library_static, java_plugin }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

asm-commons-prebuilt-jar = java_import {
    name = "asm-commons-prebuilt-jar";
    jars = ["repository/org/ow2/asm/asm-commons/5.0.1/asm-commons-5.0.1.jar"];
    sdk_version = "current";
    #  host_supported: true,  See version conflict comment below.
};

asm-prebuilt-jar = java_import {
    name = "asm-prebuilt-jar";
    jars = ["repository/org/ow2/asm/asm/5.0.1/asm-5.0.1.jar"];
    sdk_version = "current";
    #  host_supported: true,  See version conflict comment below.
};

asm-tree-prebuilt-jar = java_import {
    name = "asm-tree-prebuilt-jar";
    jars = ["repository/org/ow2/asm/asm-tree/5.0.1/asm-tree-5.0.1.jar"];
    sdk_version = "current";
    #  host_supported: true,  See version conflict comment below.
};

byte-buddy-prebuilt-jar = java_import {
    name = "byte-buddy-prebuilt-jar";
    jars = ["repository/net/bytebuddy/byte-buddy/1.6.5/byte-buddy-1.6.5.jar"];
    sdk_version = "current";
};

gson-prebuilt-jar = java_import {
    name = "gson-prebuilt-jar";
    jars = ["repository/com/google/code/gson/gson/2.8.0/gson-2.8.0.jar"];
    sdk_version = "current";
    host_supported = true;
};

guava-listenablefuture-prebuilt-jar = java_import {
    name = "guava-listenablefuture-prebuilt-jar";
    jars = ["repository/com/google/guava/guava/listenablefuture/1.0/listenablefuture-1.0.jar"];
    sdk_version = "current";
};

mockito2-prebuilt-jar = java_import {
    name = "mockito2-prebuilt-jar";
    jars = ["repository/org/mockito/mockito-core/2.7.6/mockito-core-2.7.6.jar"];
    sdk_version = "current";
};

objenesis-prebuilt-jar = java_import {
    name = "objenesis-prebuilt-jar";
    jars = ["repository/org/objenesis/objenesis/2.5/objenesis-2.5.jar"];
};

squareup-haha-prebuilt = java_import {
    name = "squareup-haha-prebuilt";
    jars = ["repository/com/squareup/haha/haha/2.0.2/haha-2.0.2.jar"];
    sdk_version = "current";
};

truth-prebuilt-jar = java_import {
    name = "truth-prebuilt-jar";
    jars = ["repository/com/google/truth/truth/0.28/truth-0.28.jar"];
    sdk_version = "current";
    host_supported = true;
};

assertj-core-prebuilt-jar = java_import {
    name = "assertj-core-prebuilt-jar";
    jars = ["repository/org/assertj/assertj-core/3.8.0/assertj-core-3.8.0.jar"];
    host_supported = true;
};

#  These versions differ. Consider updating and unifying.

asm-commons-prebuilt-host-jar = java_import_host {
    name = "asm-commons-prebuilt-host-jar";
    jars = ["repository/org/ow2/asm/asm-commons/6.0/asm-commons-6.0.jar"];
};

asm-prebuilt-host-jar = java_import_host {
    name = "asm-prebuilt-host-jar";
    jars = ["repository/org/ow2/asm/asm/6.0/asm-6.0.jar"];
};

asm-tree-prebuilt-host-jar = java_import_host {
    name = "asm-tree-prebuilt-host-jar";
    jars = ["repository/org/ow2/asm/asm-tree/6.0/asm-tree-6.0.jar"];
};

#  These are host-only prebuilts.

asm-analysis-prebuilt-host-jar = java_import_host {
    name = "asm-analysis-prebuilt-host-jar";
    jars = ["repository/org/ow2/asm/asm-analysis/6.0/asm-analysis-6.0.jar"];
};

asm-util-prebuilt-host-jar = java_import_host {
    name = "asm-util-prebuilt-host-jar";
    jars = ["repository/org/ow2/asm/asm-util/6.0/asm-util-6.0.jar"];
};

guava-prebuilt-host-jar = java_import_host {
    name = "guava-prebuilt-host-jar";
    jars = ["repository/com/google/guava/guava/22.0/guava-22.0.jar"];
    installable = true;
};

javapoet-prebuilt-jar = java_import_host {
    name = "javapoet-prebuilt-jar";
    jars = ["repository/com/squareup/javapoet/1.8.0/javapoet-1.8.0.jar"];
};

protobuf-java-prebuilt-jar = java_import_host {
    name = "protobuf-java-prebuilt-jar";
    jars = ["repository/com/google/protobuf/protobuf-java/3.0.2/protobuf-java-3.0.2.jar"];
};

protobuf-java-util-prebuilt-jar = java_import_host {
    name = "protobuf-java-util-prebuilt-jar";
    jars = ["repository/com/google/protobuf/protobuf-java-util/3.0.2/protobuf-java-util-3.0.2.jar"];
};

trove-prebuilt = java_import_host {
    name = "trove-prebuilt";
    jars = ["repository/net/sf/trove4j/trove4j/1.1/trove4j-1.1.jar"];
};

jna-prebuilt = java_import_host {
    name = "jna-prebuilt";
    jars = ["repository/net/java/dev/jna/jna/3.4.0/jna-3.4.0.jar"];
};

#  Compatibility wrappers. TODO: Remove.

truth-prebuilt-host-jar = java_library_host {
    name = "truth-prebuilt-host-jar";
    static_libs = ["truth-prebuilt-jar"];
};

#  Combined libraries.

mockito-robolectric-prebuilt = java_library_static {
    name = "mockito-robolectric-prebuilt";
    static_libs = [
        "byte-buddy-prebuilt-jar"
        "mockito2-prebuilt-jar"
        "objenesis-prebuilt-jar"
    ];
    sdk_version = "current";
};

truth-prebuilt = java_library_static {
    name = "truth-prebuilt";
    static_libs = [
        "truth-prebuilt-jar"
        "guava"
    ];
    host_supported = true;
    sdk_version = "current";
};

#  Wrapper for the above. TODO: Remove.
truth-host-prebuilt = java_library_host {
    name = "truth-host-prebuilt";
    static_libs = ["truth-prebuilt"];
};

protobuf-java-host-prebuilt = java_library_host {
    name = "protobuf-java-host-prebuilt";
    static_libs = [
        "gson-prebuilt-jar"
        "protobuf-java-prebuilt-jar"
        "protobuf-java-util-prebuilt-jar"
    ];
};

metalava-tools-common-m2-deps = java_import_host {
    name = "metalava-tools-common-m2-deps";
    jars = [
        "repository/org/ow2/asm/asm/6.1.1/asm-6.1.1.jar"
        "repository/org/ow2/asm/asm-tree/6.1.1/asm-tree-6.1.1.jar"
        "repository/com/google/guava/guava/23.0/guava-23.0.jar"
        "repository/org/jetbrains/trove4j/trove4j/20160824/trove4j-20160824.jar"
        "repository/javax/xml/bind/jaxb-api/2.2.12-b140109.1041/jaxb-api-2.2.12-b140109.1041.jar"
    ];
};

accessibility-test-framework = java_import {
    name = "accessibility-test-framework";
    jars = [
        "repository/com/google/android/apps/common/testing/accessibility/framework/accessibility-test-framework/2.0/accessibility-test-framework-2.0.jar"
    ];
};

javawriter = java_import {
    name = "javawriter";
    jars = [
        "repository/com/squareup/javawriter/2.1.1/javawriter-2.1.1.jar"
    ];
};

"dagger2-compiler-2.19-import" = java_import_host {
    name = "dagger2-compiler-2.19-import";
    jars = [
        "repository/com/google/dagger/dagger-compiler/2.19/dagger-compiler-2.19.jar"
        "repository/com/google/dagger/dagger-producers/2.19/dagger-producers-2.19.jar"
        "repository/com/google/dagger/dagger-spi/2.19/dagger-spi-2.19.jar"
        "repository/com/google/dagger/dagger/2.19/dagger-2.19.jar"
        "repository/com/google/guava/guava/25.1-jre/guava-25.1-jre.jar"
        "repository/com/squareup/javapoet/1.11.1/javapoet-1.11.1.jar"
        "repository/com/google/dagger/dagger-google-java-format/1.6/google-java-format-1.6-all-deps.jar"
    ];
};

"dagger2-2.19" = java_import {
    name = "dagger2-2.19";
    jars = ["repository/com/google/dagger/dagger/2.19/dagger-2.19.jar"];
    host_supported = true;
};

"dagger2-compiler-2.19" = java_plugin {
    name = "dagger2-compiler-2.19";
    static_libs = [
        "dagger2-compiler-2.19-import"
        "jsr330"
    ];
    processor_class = "dagger.internal.codegen.ComponentProcessor";
    generates_api = true;
};

car-androidx-room-compiler-tools-common-m2-deps = java_import_host {
    name = "car-androidx-room-compiler-tools-common-m2-deps";
    jars = [
        "repository/org/antlr/antlr4/4.5.3/antlr4-4.5.3.jar"
        "repository/org/eclipse/tycho/tycho-bundles-external/0.18.1/eclipse/plugins/org.apache.commons.codec_1.4.0.v201209201156.jar"
        "repository/com/google/auto/auto-common/0.9/auto-common-0.9.jar"
        "repository/com/squareup/javapoet/1.8.0/javapoet-1.8.0.jar"
        #  TODO: remove this one?
        "repository/org/jetbrains/annotations/13.0/annotations-13.0.jar"
        "repository/me/eugeniomarletti/kotlin-metadata/1.2.1/kotlin-metadata-1.2.1.jar"
        "repository/org/xerial/sqlite-jdbc/3.20.1/sqlite-jdbc-3.20.1.jar"
        "repository/com/google/guava/guava/21.0/guava-21.0.jar"
    ];
    #  Exclude signature files that cause the combined jar to be rejected.
    exclude_files = [
        "META-INF/ECLIPSE_.SF"
        "META-INF/ECLIPSE_.RSA"
    ];
};

in { inherit "dagger2-2.19" "dagger2-compiler-2.19" "dagger2-compiler-2.19-import" accessibility-test-framework asm-analysis-prebuilt-host-jar asm-commons-prebuilt-host-jar asm-commons-prebuilt-jar asm-prebuilt-host-jar asm-prebuilt-jar asm-tree-prebuilt-host-jar asm-tree-prebuilt-jar asm-util-prebuilt-host-jar assertj-core-prebuilt-jar byte-buddy-prebuilt-jar car-androidx-room-compiler-tools-common-m2-deps gson-prebuilt-jar guava-listenablefuture-prebuilt-jar guava-prebuilt-host-jar javapoet-prebuilt-jar javawriter jna-prebuilt metalava-tools-common-m2-deps mockito-robolectric-prebuilt mockito2-prebuilt-jar objenesis-prebuilt-jar protobuf-java-host-prebuilt protobuf-java-prebuilt-jar protobuf-java-util-prebuilt-jar squareup-haha-prebuilt trove-prebuilt truth-host-prebuilt truth-prebuilt truth-prebuilt-host-jar truth-prebuilt-jar; }
