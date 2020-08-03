{ java_defaults, java_library_static, java_system_modules }:
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

framework-stubs-default = java_defaults {
    name = "framework-stubs-default";
    errorprone = {
        javacflags = [
            "-XepDisableAllChecks"
        ];
    };
    java_resources = [
        ":notices-for-framework-stubs"
    ];
    no_standard_libs = true;
    system_modules = "none";
    java_version = "1.8";
    compile_dex = true;
};

android_stubs_current = java_library_static {
    name = "android_stubs_current";
    srcs = [
        ":api-stubs-docs"
    ];
    libs = [
        "stub-annotations"
    ];
    static_libs = [
        "private-stub-annotations-jar"
    ];
    defaults = ["framework-stubs-default"];
};

android_stubs_current_system_modules = java_system_modules {
    name = "android_stubs_current_system_modules";
    libs = ["android_stubs_current"];
};

android_system_stubs_current = java_library_static {
    name = "android_system_stubs_current";
    srcs = [
        ":system-api-stubs-docs"
    ];
    libs = [
        "stub-annotations"
    ];
    static_libs = [
        "private-stub-annotations-jar"
    ];
    defaults = ["framework-stubs-default"];
};

android_system_stubs_current_system_modules = java_system_modules {
    name = "android_system_stubs_current_system_modules";
    libs = ["android_system_stubs_current"];
};

android_test_stubs_current = java_library_static {
    name = "android_test_stubs_current";
    srcs = [
        ":test-api-stubs-docs"
    ];
    libs = [
        "stub-annotations"
    ];
    static_libs = [
        "private-stub-annotations-jar"
    ];
    defaults = ["framework-stubs-default"];
};

android_test_stubs_current_system_modules = java_system_modules {
    name = "android_test_stubs_current_system_modules";
    libs = ["android_test_stubs_current"];
};

in { inherit android_stubs_current android_stubs_current_system_modules android_system_stubs_current android_system_stubs_current_system_modules android_test_stubs_current android_test_stubs_current_system_modules framework-stubs-default; }
