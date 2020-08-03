{ java_binary_host, java_defaults, java_library_host, java_test_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

trebuchet-defaults = java_defaults {
    name = "trebuchet-defaults";
    javacflags = [
        "-Xcoroutines=enable"
    ];
};

trebuchet-core = java_library_host {
    name = "trebuchet-core";
    defaults = ["trebuchet-defaults"];
    srcs = [
        "core/common/src/main/**/*.kt"
        "core/model/src/main/**/*.kt"
    ];
    libs = [
        "kotlin-reflect"
    ];
    no_framework_libs = true;
};

trebuchet-startup-common = java_library_host {
    name = "trebuchet-startup-common";
    defaults = ["trebuchet-defaults"];
    srcs = [
        "trebuchet/startup-common/src/**/*.kt"
    ];
    libs = [
        "trebuchet-core"
    ];
    no_framework_libs = true;
};

trebuchet-core-tests = java_test_host {
    name = "trebuchet-core-tests";
    defaults = ["trebuchet-defaults"];
    srcs = [
        "core/common/src/test/**/*.kt"
    ];
    static_libs = [
        "trebuchet-core"
        "kotlin-test"
    ];
    libs = [
        "junit"
        "kotlin-reflect"
    ];
    test_suites = ["general-tests"];
};

trebuchet-startup-common-tests = java_test_host {
    name = "trebuchet-startup-common-tests";
    defaults = ["trebuchet-defaults"];
    srcs = [
        "trebuchet/startup-common/test/**/*.kt"
    ];
    static_libs = [
        "trebuchet-core"
        "trebuchet-startup-common"
    ];
    libs = [
        "junit"
    ];
    test_suites = ["general-tests"];
};

AnalyzerKt = java_binary_host {
    name = "AnalyzerKt";
    defaults = ["trebuchet-defaults"];
    manifest = "trebuchet/analyzer/MANIFEST.mf";
    srcs = [
        "trebuchet/analyzer/src/**/*.kt"
    ];
    static_libs = [
        "trebuchet-core"
    ];
};

StartupAnalyzerKt = java_binary_host {
    name = "StartupAnalyzerKt";
    defaults = ["trebuchet-defaults"];
    manifest = "trebuchet/startup-analyzer/MANIFEST.mf";
    srcs = [
        "trebuchet/startup-analyzer/src/**/*.kt"
    ];
    static_libs = [
        "trebuchet-core"
        "trebuchet-startup-common"
    ];
};

StartupSummarizerKt = java_binary_host {
    name = "StartupSummarizerKt";
    defaults = ["trebuchet-defaults"];
    manifest = "trebuchet/startup-summarizer/MANIFEST.mf";
    srcs = [
        "trebuchet/startup-summarizer/src/**/*.kt"
    ];
    static_libs = [
        "trebuchet-core"
        "trebuchet-startup-common"
    ];
};

traceutils = java_binary_host {
    name = "traceutils";
    defaults = ["trebuchet-defaults"];
    manifest = "trebuchet/traceutils/MANIFEST.mf";
    srcs = [
        "trebuchet/traceutils/src/**/*.kt"
    ];
    static_libs = [
        "trebuchet-core"
    ];
};

traceviewer = java_binary_host {
    name = "traceviewer";
    defaults = ["trebuchet-defaults"];
    manifest = "trebuchet/viewer/MANIFEST.mf";
    srcs = [
        "trebuchet/viewer/src/main/**/*.kt"
    ];
    static_libs = [
        "trebuchet-core"
    ];
};

in { inherit AnalyzerKt StartupAnalyzerKt StartupSummarizerKt traceutils traceviewer trebuchet-core trebuchet-core-tests trebuchet-defaults trebuchet-startup-common trebuchet-startup-common-tests; }
