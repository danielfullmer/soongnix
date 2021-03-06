{ java_library, java_library_host, java_test_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

GameQualificationHelper = java_library {
    name = "GameQualificationHelper";
    srcs = [
        "src/com/android/game/qualification/ApkInfo.java"
        "src/com/android/game/qualification/CertificationRequirements.java"
        "src/com/android/game/qualification/GameCoreConfiguration.java"
        "src/com/android/game/qualification/GameCoreConfigurationXmlParser.java"
        "src/com/android/game/qualification/ResultData.java"
        "proto/resultdata.proto"
    ];
    sdk_version = "26"; #  Oreo
    proto = {
        type = "lite";
    };
};

GameQualificationHelperHost = java_library_host {
    name = "GameQualificationHelperHost";
    srcs = [
        "src/com/android/game/qualification/ApkInfo.java"
        "src/com/android/game/qualification/CertificationRequirements.java"
        "src/com/android/game/qualification/GameCoreConfiguration.java"
        "src/com/android/game/qualification/GameCoreConfigurationXmlParser.java"
        "src/com/android/game/qualification/ResultData.java"
        "proto/resultdata.proto"
    ];
    proto = {
        type = "lite";
    };
    libs = [
        "libprotobuf-java-lite"
    ];
};

#  Test
GameQualificationHelperTest = java_test_host {
    name = "GameQualificationHelperTest";
    srcs = ["test/com/android/game/qualification/GameCoreConfigurationXmlParserTest.java"];
    test_suites = [
        "general-tests"
    ];
    libs = [
        "GameQualificationHelperHost"
        "junit-host"
    ];
};

in { inherit GameQualificationHelper GameQualificationHelperHost GameQualificationHelperTest; }
