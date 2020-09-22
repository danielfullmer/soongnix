{ java_import, java_plugin }:
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

car-br-auto-value-jar = java_import {
    name = "car-br-auto-value-jar";
    host_supported = true;
    sdk_version = "current";
    jars = ["auto-value-1.5.2.jar"];
};

car-br-auto-value = java_plugin {
    name = "car-br-auto-value";
    static_libs = [
        "car-br-auto-value-jar"
        "guava"
    ];
    processor_class = "com.google.auto.value.processor.AutoValueProcessor";
};

car-br-google-api-java-client-jar = java_import {
    name = "car-br-google-api-java-client-jar";
    jars = ["google-api-client-1.30.2.jar"];
    sdk_version = "current";
};

car-br-google-api-client-android-jar = java_import {
    name = "car-br-google-api-client-android-jar";
    jars = ["google-api-client-android-1.30.2.jar"];
    sdk_version = "current";
};

car-br-google-storage-services-jar = java_import {
    name = "car-br-google-storage-services-jar";
    jars = ["google-api-services-storage-v1-rev158-1.25.0.jar"];
    sdk_version = "current";
};

car-br-google-oauth-client-jar = java_import {
    name = "car-br-google-oauth-client-jar";
    jars = ["google-oauth-client-1.30.1.jar"];
    sdk_version = "current";
};

car-br-google-http-client-jar = java_import {
    name = "car-br-google-http-client-jar";
    jars = ["google-http-client-1.30.1.jar"];
    sdk_version = "current";
};

car-br-google-http-client-android-jar = java_import {
    name = "car-br-google-http-client-android-jar";
    jars = ["google-http-client-android-1.30.1.jar"];
    sdk_version = "current";
};

car-br-google-http-client-jackson2-jar = java_import {
    name = "car-br-google-http-client-jackson2-jar";
    jars = ["google-http-client-jackson2-1.30.1.jar"];
    sdk_version = "current";
};

car-br-grpc-context-jar = java_import {
    name = "car-br-grpc-context-jar";
    jars = ["grpc-context-1.19.0.jar"];
    sdk_version = "current";
};

car-br-jackson-core-jar = java_import {
    name = "car-br-jackson-core-jar";
    jars = ["jackson-core-2.9.9.jar"];
    sdk_version = "current";
};

car-br-opencensus-api-jar = java_import {
    name = "car-br-opencensus-api-jar";
    jars = ["opencensus-api-0.21.0.jar"];
    sdk_version = "current";
};

car-br-opencensus-contrib-http-util-jar = java_import {
    name = "car-br-opencensus-contrib-http-util-jar";
    jars = ["opencensus-contrib-http-util-0.21.0.jar"];
    sdk_version = "current";
};

in { inherit car-br-auto-value car-br-auto-value-jar car-br-google-api-client-android-jar car-br-google-api-java-client-jar car-br-google-http-client-android-jar car-br-google-http-client-jackson2-jar car-br-google-http-client-jar car-br-google-oauth-client-jar car-br-google-storage-services-jar car-br-grpc-context-jar car-br-jackson-core-jar car-br-opencensus-api-jar car-br-opencensus-contrib-http-util-jar; }
