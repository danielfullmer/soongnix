{ java_library }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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
#

slf4j-jdk14 = java_library {
    name = "slf4j-jdk14";
    hostdex = true;
    srcs = [
        "slf4j-api/src/main/java/org/slf4j/ILoggerFactory.java"
        "slf4j-api/src/main/java/org/slf4j/IMarkerFactory.java"
        "slf4j-api/src/main/java/org/slf4j/Logger.java"
        "slf4j-api/src/main/java/org/slf4j/LoggerFactory.java"
        "slf4j-api/src/main/java/org/slf4j/MDC.java"
        "slf4j-api/src/main/java/org/slf4j/Marker.java"
        "slf4j-api/src/main/java/org/slf4j/MarkerFactory.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/BasicMDCAdapter.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/BasicMarker.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/BasicMarkerFactory.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/FormattingTuple.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/MarkerIgnoringBase.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/MessageFormatter.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/NOPLogger.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/NOPLoggerFactory.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/NOPMDCAdapter.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/NamedLoggerBase.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/SubstituteLogger.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/SubstituteLoggerFactory.java"
        "slf4j-api/src/main/java/org/slf4j/helpers/Util.java"
        "slf4j-api/src/main/java/org/slf4j/impl/StaticLoggerBinder.java"
        "slf4j-api/src/main/java/org/slf4j/impl/StaticMDCBinder.java"
        "slf4j-api/src/main/java/org/slf4j/impl/StaticMarkerBinder.java"
        "slf4j-api/src/main/java/org/slf4j/spi/LocationAwareLogger.java"
        "slf4j-api/src/main/java/org/slf4j/spi/LoggerFactoryBinder.java"
        "slf4j-api/src/main/java/org/slf4j/spi/MDCAdapter.java"
        "slf4j-api/src/main/java/org/slf4j/spi/MarkerFactoryBinder.java"
        "slf4j-jdk14/src/main/java/org/slf4j/impl/JDK14LoggerAdapter.java"
        "slf4j-jdk14/src/main/java/org/slf4j/impl/JDK14LoggerFactory.java"
        "slf4j-jdk14/src/main/java/org/slf4j/impl/StaticLoggerBinder.java"
        "slf4j-jdk14/src/main/java/org/slf4j/impl/StaticMDCBinder.java"
        "slf4j-jdk14/src/main/java/org/slf4j/impl/StaticMarkerBinder.java"
    ];
    exclude_srcs = [
        "slf4j-api/src/main/java/org/slf4j/impl/StaticLoggerBinder.java"
        "slf4j-api/src/main/java/org/slf4j/impl/StaticMDCBinder.java"
        "slf4j-api/src/main/java/org/slf4j/impl/StaticMarkerBinder.java"
    ];

    sdk_version = "core_current";
};

in { inherit slf4j-jdk14; }
