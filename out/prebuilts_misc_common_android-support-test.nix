{ java_import, java_library_static }:
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

#  DEPRECATED! Use androidx-test libraries instead

#  for Android JUnit runner, monitor and rules
android-support-test = java_library_static {
    name = "android-support-test";
    sdk_version = "15";
    static_libs = [
        "android-support-test-rules-nodep"
        "android-support-test-runner-nodep"
        "junit"
        "hamcrest"
        "hamcrest-library"
        "android-support-annotations"
        "android-support-test-monitor-nodep"
    ];
};

android-support-test-nodep = java_library_static {
    name = "android-support-test-nodep";
    sdk_version = "23";
    static_libs = [
        "android-support-test-rules-nodep"
        "android-support-test-runner-nodep"
        "android-support-test-monitor-nodep"
    ];
};

android-support-test-rules-nodep = java_import {
    name = "android-support-test-rules-nodep";
    jars = ["rules/rules_release_no_deps.jar"];
    sdk_version = "15";
};

android-support-test-runner-nodep = java_import {
    name = "android-support-test-runner-nodep";
    jars = ["runner/runner_release_no_deps.jar"];
    sdk_version = "15";
};

android-support-test-monitor-nodep = java_import {
    name = "android-support-test-monitor-nodep";
    jars = ["monitor/monitor_release_no_deps.jar"];
    sdk_version = "15";
};

#  for espresso-core
espresso-core = java_library_static {
    name = "espresso-core";
    sdk_version = "15";
    static_libs = [
        "espresso-core-nodep"
        "espresso-idling-resource-nodep"
        "android-support-test-rules-nodep"
        "android-support-test-runner-nodep"
        "android-support-test-monitor-nodep"
        "junit"
        "hamcrest"
        "hamcrest-library"
        "android-support-annotations"
        "jsr330"
    ];
};

espresso-core-nodep = java_import {
    name = "espresso-core-nodep";
    jars = ["espresso/espresso_core_release_no_deps.jar"];
    sdk_version = "15";
};

#  for espresso-contrib
espresso-contrib = java_library_static {
    name = "espresso-contrib";
    sdk_version = "15";
    static_libs = [
        "espresso-core"
        "android-support-design"
        "android-support-v7-recyclerview"
        "android-support-v4"
    ];
};

espresso-contrib-nodep = java_import {
    name = "espresso-contrib-nodep";
    jars = ["espresso/espresso_contrib_release_no_deps.jar"];
    sdk_version = "15";
};

#  for espresso-idling-resource
espresso-idling-resource-nodep = java_import {
    name = "espresso-idling-resource-nodep";
    jars = ["espresso/espresso_idling_resource_release_no_deps.jar"];
    sdk_version = "15";
};

#  for espresso-intents
espresso-intents = java_library_static {
    name = "espresso-intents";
    sdk_version = "15";
    static_libs = [
        "espresso-intents-nodep"
        "espresso-core"
        "android-support-test-rules-nodep"
    ];
};

espresso-intents-nodep = java_import {
    name = "espresso-intents-nodep";
    jars = ["espresso/espresso_intents_release_no_deps.jar"];
    sdk_version = "15";
};

#  for espresso-web
espresso-web = java_library_static {
    name = "espresso-web";
    sdk_version = "15";
    static_libs = [
        "espresso-core"
        "android-support-annotations"
        "tagsoup"
    ];
};

espresso-web-nodep = java_import {
    name = "espresso-web-nodep";
    jars = ["espresso/espresso_web_release_no_deps.jar"];
    sdk_version = "15";
};

in { inherit android-support-test android-support-test-monitor-nodep android-support-test-nodep android-support-test-rules-nodep android-support-test-runner-nodep espresso-contrib espresso-contrib-nodep espresso-core espresso-core-nodep espresso-idling-resource-nodep espresso-intents espresso-intents-nodep espresso-web espresso-web-nodep; }
