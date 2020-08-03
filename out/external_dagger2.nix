{ java_import_host, java_library_host, java_plugin }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

dagger2-auto-common = java_import_host {
    name = "dagger2-auto-common";
    jars = ["lib/auto-common-1.0-20151022.071545-39.jar"];
};

dagger2-auto-factory-jar = java_import_host {
    name = "dagger2-auto-factory-jar";
    jars = ["lib/auto-factory-1.0-20150915.183854-35.jar"];
};

dagger2-auto-factory = java_plugin {
    name = "dagger2-auto-factory";
    processor_class = "com.google.auto.factory.processor.AutoFactoryProcessor";
    static_libs = [
        "dagger2-auto-factory-jar"
        "dagger2-auto-common"
        "guava"
    ];
};

dagger2-auto-service-jar = java_import_host {
    name = "dagger2-auto-service-jar";
    jars = ["lib/auto-service-1.0-rc2.jar"];
};

dagger2-auto-service = java_plugin {
    name = "dagger2-auto-service";
    processor_class = "com.google.auto.service.processor.AutoServiceProcessor";
    static_libs = [
        "dagger2-auto-common"
        "dagger2-auto-service-jar"
        "guava"
    ];
};

dagger2-auto-value-jar = java_import_host {
    name = "dagger2-auto-value-jar";
    jars = ["lib/auto-value-1.4.1.jar"];
};

dagger2-auto-value = java_plugin {
    name = "dagger2-auto-value";
    processor_class = "com.google.auto.value.processor.AutoValueProcessor";
    static_libs = ["dagger2-auto-value-jar"];
};

dagger2-auto-annotation = java_plugin {
    name = "dagger2-auto-annotation";
    processor_class = "com.google.auto.value.processor.AutoAnnotationProcessor";
    static_libs = ["dagger2-auto-value-jar"];
};

dagger2-google-java-format = java_import_host {
    name = "dagger2-google-java-format";
    jars = ["lib/google-java-format-0.1-20151017.042846-2.jar"];
};

dagger2-inject = java_import_host {
    name = "dagger2-inject";
    jars = ["lib/javax-inject.jar"];
};

dagger2 = java_library_host {
    name = "dagger2";

    srcs = ["core/src/main/java/**/*.java"];

    static_libs = ["dagger2-inject"];

    libs = ["guava"];

    java_version = "1.7";
};

#  build dagger2 producers plugin
#  ============================================================

dagger2-producers = java_plugin {
    name = "dagger2-producers";

    srcs = ["producers/src/main/java/**/*.java"];

    static_libs = ["dagger2-inject"];

    libs = [
        "dagger2"
        "guava"
    ];

    java_version = "1.7";
};

#  build dagger2 compiler plugin
#  ============================================================

dagger2-compiler = java_plugin {
    name = "dagger2-compiler";
    processor_class = "dagger.internal.codegen.ComponentProcessor";
    generates_api = true;

    #  Required for use of javax.annotation.Generated per http://b/62050818
    javacflags = ["-J--add-modules=java.xml.ws.annotation"];
    srcs = ["compiler/src/main/java/**/*.java"];

    #  Manually include META-INF/services/javax.annotation.processing.Processor
    #  as the AutoService processor doesn't work properly.
    java_resource_dirs = ["resources"];

    static_libs = [
        "dagger2"
        "dagger2-auto-common"
        "dagger2-auto-factory"
        "dagger2-auto-service"
        "dagger2-auto-value"
        "dagger2-google-java-format"
        "dagger2-inject"
        "dagger2-producers"
        "guava"
    ];

    plugins = [
        "dagger2-auto-factory"
        "dagger2-auto-service"
        "dagger2-auto-value"
        "dagger2-auto-annotation"
    ];

    java_version = "1.7";
};

in { inherit dagger2 dagger2-auto-annotation dagger2-auto-common dagger2-auto-factory dagger2-auto-factory-jar dagger2-auto-service dagger2-auto-service-jar dagger2-auto-value dagger2-auto-value-jar dagger2-compiler dagger2-google-java-format dagger2-inject dagger2-producers; }
