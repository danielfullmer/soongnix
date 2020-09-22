{ android_test_helper_app }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

CtsExternalServiceService = android_test_helper_app {
    name = "CtsExternalServiceService";
    defaults = ["cts_support_defaults"];
    static_libs = [
        "CtsExternalServiceCommon"
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    srcs = [
        "src/android/externalservice/service/BaseService.java"
        "src/android/externalservice/service/ExportedService.java"
        "src/android/externalservice/service/ExternalNonExportedService.java"
        "src/android/externalservice/service/ExternalNonIsolatedService.java"
        "src/android/externalservice/service/ExternalService.java"
        "src/android/externalservice/service/ExternalServiceWithZygote.java"
        "src/android/externalservice/service/IsolatedService.java"
        "src/android/externalservice/service/ServiceCreator.java"
        "src/android/externalservice/service/ZygotePreload.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsExternalServiceService; }
