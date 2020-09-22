{ cc_binary, cc_defaults, cc_test, java_binary }:
let

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

incident-helper-cmd = java_binary {
    name = "incident-helper-cmd";
    wrapper = "incident_helper_cmd";
    srcs = [
        "java/com/android/commands/incident/ExecutionException.java"
        "java/com/android/commands/incident/IncidentHelper.java"
        "java/com/android/commands/incident/Section.java"
        "java/com/android/commands/incident/sections/PersistLogSection.java"
    ];
    proto = {
        plugin = "javastream";
    };
};

incident_helper_defaults = cc_defaults {
    name = "incident_helper_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-g"
        "-O0"
    ];

    local_include_dirs = [
        "src/"
        "src/parsers/"
    ];

    srcs = [
        "src/parsers/BatteryTypeParser.cpp"
        "src/parsers/CpuFreqParser.cpp"
        "src/parsers/CpuInfoParser.cpp"
        "src/parsers/EventLogTagsParser.cpp"
        "src/parsers/KernelWakesParser.cpp"
        "src/parsers/PageTypeInfoParser.cpp"
        "src/parsers/ProcrankParser.cpp"
        "src/parsers/PsParser.cpp"
        "src/parsers/SystemPropertiesParser.cpp"
        "src/TextParserBase.cpp"
        "src/ih_util.cpp"
    ];

    generated_headers = ["framework-cppstream-protos"];

    shared_libs = [
        "libbase"
        "liblog"
        "libprotoutil"
        "libutils"
    ];
};

incident_helper = cc_binary {
    name = "incident_helper";
    defaults = ["incident_helper_defaults"];
    srcs = ["src/main.cpp"];
};

incident_helper_test = cc_test {
    name = "incident_helper_test";
    test_suites = ["device-tests"];
    defaults = ["incident_helper_defaults"];
    local_include_dirs = ["src/"];

    srcs = [
        "tests/BatteryTypeParser_test.cpp"
        "tests/CpuFreqParser_test.cpp"
        "tests/CpuInfoParser_test.cpp"
        "tests/EventLogTagsParser_test.cpp"
        "tests/KernelWakesParser_test.cpp"
        "tests/PageTypeInfoParser_test.cpp"
        "tests/ProcrankParser_test.cpp"
        "tests/PsParser_test.cpp"
        "tests/SystemPropertiesParser_test.cpp"
        "tests/ih_util_test.cpp"
    ];

    data = [
        "testdata/batterytype.txt"
        "testdata/cpufreq.txt"
        "testdata/cpuinfo.txt"
        "testdata/event-log-tags.txt"
        "testdata/kernel_wakeups.txt"
        "testdata/kernel_wakeups_short.txt"
        "testdata/pagetypeinfo.txt"
        "testdata/procrank.txt"
        "testdata/procrank_short.txt"
        "testdata/ps.txt"
        "testdata/system_properties.txt"
    ];

    static_libs = [
        "libgmock"
        "libplatformprotos"
    ];

    shared_libs = [
        "libprotobuf-cpp-full"
    ];
    proto = {
        type = "full";
    };
};

in { inherit incident-helper-cmd incident_helper incident_helper_defaults incident_helper_test; }
