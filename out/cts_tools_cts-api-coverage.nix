{ java_binary_host, java_library_host }:
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

api-coverage = java_library_host {
    name = "api-coverage";

    srcs = [
        "src/com/android/cts/apicoverage/ApiClass.java"
        "src/com/android/cts/apicoverage/ApiConstructor.java"
        "src/com/android/cts/apicoverage/ApiCoverage.java"
        "src/com/android/cts/apicoverage/ApiMethod.java"
        "src/com/android/cts/apicoverage/ApiPackage.java"
        "src/com/android/cts/apicoverage/ApkNdkApiReport.java"
        "src/com/android/cts/apicoverage/CddCoverage.java"
        "src/com/android/cts/apicoverage/ComparisonReport.java"
        "src/com/android/cts/apicoverage/CtsApiCoverage.java"
        "src/com/android/cts/apicoverage/CtsReportHandler.java"
        "src/com/android/cts/apicoverage/CtsReportParser.java"
        "src/com/android/cts/apicoverage/CurrentXmlHandler.java"
        "src/com/android/cts/apicoverage/DexDepsXmlHandler.java"
        "src/com/android/cts/apicoverage/GTestApiReport.java"
        "src/com/android/cts/apicoverage/HasCoverage.java"
        "src/com/android/cts/apicoverage/HtmlReport.java"
        "src/com/android/cts/apicoverage/JarTestFinder.java"
        "src/com/android/cts/apicoverage/NdkApiXmlReport.java"
        "src/com/android/cts/apicoverage/PackageFilter.java"
        "src/com/android/cts/apicoverage/TestCaseReport.java"
        "src/com/android/cts/apicoverage/TestModule.java"
        "src/com/android/cts/apicoverage/TestModuleConfigHandler.java"
        "src/com/android/cts/apicoverage/TestSuiteContentReport.java"
        "src/com/android/cts/apicoverage/TextReport.java"
        "src/com/android/cts/apicoverage/XmlReport.java"
        "proto/cts_report.proto"
        "proto/testsuite.proto"
    ];

    proto = {
        type = "full";
        local_include_dirs = ["proto"];
    };

    java_resource_dirs = ["res"];

    static_libs = [
        "compatibility-host-util"
        "dexlib2"
        #  This tool is not checking any dependencies or metadata, so all of the
        #  dependencies of all of the tests must be on its classpath. This is
        #  super fragile.
        "tradefed"
        "hosttestlib"
        "platformprotos"
    ];
};

cts-api-coverage = java_binary_host {
    name = "cts-api-coverage";
    wrapper = "etc/cts-api-coverage";
    static_libs = ["api-coverage"];
    manifest = "MANIFEST.mf";
};

ndk-api-report = java_binary_host {
    name = "ndk-api-report";
    wrapper = "etc/ndk-api-report";
    static_libs = ["api-coverage"];
    manifest = "MANIFEST.mf";
};

in { inherit api-coverage cts-api-coverage ndk-api-report; }
